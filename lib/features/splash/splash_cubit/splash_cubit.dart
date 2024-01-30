import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
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
    await Future.delayed(const Duration(seconds: 1));
    final accessToken = prefs.getString(SharedKeys.accessToken) ?? '';
    try {
      final result = await useCase.existsUser() ?? '';
      if (result.isNotEmpty) {
        prefs.setString(SharedKeys.accessToken, result);
        AppRouting.pushAndPopUntilFunction(const PinCodeEnterRoute());
      } else {
        AppRouting.pushAndPopUntilFunction(const AuthRoute());
      }
    } catch (e) {
      if (accessToken.isEmpty) {
        AppRouting.pushAndPopUntilFunction(const AuthRoute());
      } else {
        AppRouting.pushAndPopUntilFunction(const PinCodeEnterRoute());
      }
      AppSnackBar.showSnackBar(e.toString());
    }
  }
}
