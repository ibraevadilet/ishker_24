import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ishker_24/translations/locale_keys.g.dart';

class MessageException implements Exception {
  MessageException(this.msg);

  final String msg;

  @override
  String toString() => msg;
}

class NoConnectionException implements Exception {}

class UnsupportedPlatformException implements Exception {}

extension ExceptionX on Exception {
  String get message => switch (this) {
        MessageException(msg: String msg) => msg,
        NoConnectionException() => LocaleKeys.catchExNoInternet.tr(),
        FormatException() => 'Ошибка формата ответа сервера',
        UnsupportedPlatformException() => 'UnsupportedPlatformException',
        DioException() => _dioMessage,
        _ => LocaleKeys.catchExSystemError.tr(),
      };

  String get _dioMessage {
    final e = this as DioException;
    String? message = e.response?.data['error'];
    switch (e.type) {
      case DioExceptionType.connectionTimeout ||
            DioExceptionType.receiveTimeout ||
            DioExceptionType.sendTimeout:
        return LocaleKeys.catchExTimeOfProcessing.tr();

      case DioExceptionType.badCertificate:
        return 'DioExceptionType.badCertificate';

      default:
        final data = e.response?.data;
        if (data['error'] == 'invalid username or password') {
          return 'Неверный пин код';
        }
        if (e.response?.statusCode == 400) {
          final status = data['body']?['status'];
          message = switch (status) {
            'EmailIncorrect' => 'Указан неверный e-mail',
            'UserHaveNoEmail' =>
              'К данному аккаунту не привязана почта. Привяжите, пожалуйста, через Тундук',
            'UserHaveNoPhoneNumber' =>
              'К данному аккаунту не привязан номер телефона. Привяжите, пожалуйста, через Тундук',
            'PhoneNumberEmptyOrIncorrect' => 'Указан неверный номер',
            //TODO: SmsHasBeenSended error?
            'SmsHasBeenSended' => 'sms code был отправлен',
            'InValidResetPinCodeToken' ||
            'InvalidOtp' =>
              'Неверный код подтверждения',
            'NoUserFound' => 'Пользователь не найден',
            _ => data['error'],
          };

          if (message != null && message != data['error']) return message;

          final signInResult = data['body']?['signInResult'];
          message = switch (signInResult) {
            'Неверный код' => 'Неверный код',
            'IsLockedOut' => 'Пользователь заблокирован',
            'InvalidLoginAttempt' => 'Неверный пароль',
            _ => data['error'],
          };

          log(message ?? 'empty message');
          if (message != null && message != data['error']) return message;

          final twoFactorSessionToken = data['twoFactorSessionToken'];
          message = switch (twoFactorSessionToken) {
            'Неверный пароль!' => 'Неверный пароль!',
            'Ваша учетная запись заблокирована  системой!\nПовторите попытку позже.' =>
              'Ваша учетная запись заблокирована  системой!\nПовторите попытку позже.',
            _ => data['error'],
          };
          log(message ?? 'empty message');
        }
    }

    return message ?? LocaleKeys.catchExSystemError.tr();
  }
}
