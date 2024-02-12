import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.useCase,
    required this.prefs,
  }) : super(const SplashState.initial());
  final ExistsUserUseCase useCase;
  final SharedPreferences prefs;

  Future<void> getFirstOpenStatus() async {
    prefs.remove(SharedKeys.accessToken);
    await Future.delayed(const Duration(seconds: 1));
    try {
      final resultPin = await useCase.existsUser();
      if (resultPin.isNotEmpty) {
        prefs.setString(SharedKeys.pin, resultPin);
        AppRouting.pushAndPopUntilFunction(PinCodeEnterRoute());
      } else {
        AppRouting.pushAndPopUntilFunction(const AuthRoute());
      }
    } catch (e) {
      AppRouting.pushAndPopUntilFunction(const AuthRoute());
    }
  }

  // Future<void> getToken() async {
  //   final token = prefs.getString(SharedKeys.ishekrAccessToken) ?? '';
  //   final pin = prefs.getString(SharedKeys.pin) ?? '';
  //   try {
  //     final result = await useCase.getToken(pin);
  //     if (result.accessToken.isNotEmpty) {
  //       prefs.setString(SharedKeys.ishekrAccessToken, result.accessToken);
  //       AppRouting.pushAndPopUntilFunction(const PinCodeEnterRoute());
  //     } else {
  //       AppRouting.pushAndPopUntilFunction(const AuthRoute());
  //     }
  //   } catch (e) {
  //     if (token.isEmpty) {
  //       AppRouting.pushAndPopUntilFunction(const AuthRoute());
  //     } else {
  //       AppRouting.pushAndPopUntilFunction(const PinCodeEnterRoute());
  //     }
  //     AppSnackBar.showSnackBar(e.toString());
  //   }
  // }
}
