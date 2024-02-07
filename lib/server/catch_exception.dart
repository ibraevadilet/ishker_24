import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ishker_24/translations/locale_keys.g.dart';

class CatchException {
  CatchException({required this.message});
  final String message;

  static CatchException convertException(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout) {
        return CatchException(message: LocaleKeys.catchExTimeOfProcessing.tr());
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return CatchException(message: LocaleKeys.catchExTimeOfProcessing.tr());
      } else if (error.response == null) {
        return CatchException(message: LocaleKeys.catchExNoInternet.tr());
      } else if (error.response!.statusCode == 400) {
        if (error.response!.data['error'] == 'invalid username or password') {
          return CatchException(message: 'Неверный пин код');
        } else if (error.response!.data['body']?['signInResult'] ==
            'Неверный код') {
          return CatchException(message: 'Неверный код');
        } else if (error.response!.data['body']?['status'] ==
            'EmailIncorrect') {
          return CatchException(message: 'Указан неверный e-mail');
        } else if (error.response!.data['body']?['status'] ==
            'PhoneNumberEmptyOrIncorrect') {
          return CatchException(message: 'Указан неверный номер');
        } else if (error.response!.data['body']?['signInResult'] ==
            'IsLockedOut') {
          return CatchException(message: 'Пользователь заблокирован');
        } else if (error.response!.data['body']?['signInResult'] ==
            'InvalidLoginAttempt') {
          return CatchException(message: 'Неверный пароль');
        } else if (error.response!.data['body']?['signInResult'] ==
            'IsLockedOut') {
        } else if (error.response!.data['body']?['status'] ==
            'SmsHasBeenSended') {
          return CatchException(message: 'sms code был отправлен');
        } else if (error.response!.data['body']?['signInResult'] ==
            'IsLockedOut') {
          return CatchException(message: 'Пользователь заблокирован');
        } else if (error.response!.data['body']?['status'] ==
                'InValidResetPinCodeToken' ||
            error.response!.data['body']['status'] == 'InvalidOtp') {
          return CatchException(message: 'Неверный код подтверждения');
        } else if (error.response!.data['body']['status'] == 'NoUserFound') {
          return CatchException(message: 'Пользователь не найден');
        } else {
          return CatchException(message: error.response!.data['error']);
        }
      } else if (error.response!.statusCode == 405) {
        return CatchException(message: error.response!.data['error']);
      } else if (error.response!.statusCode == 400) {
        return CatchException(message: error.response!.data['error']);
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data['error']);
      } else if (error.response!.statusCode == 415) {
        return CatchException(message: error.response!.data['error']);
      } else if (error.response!.statusCode == 500) {
        return CatchException(message: error.response!.data['error']);
      } else {
        return CatchException(message: LocaleKeys.catchExSystemError.tr());
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: LocaleKeys.catchExSystemError.tr());
    }
  }
}
