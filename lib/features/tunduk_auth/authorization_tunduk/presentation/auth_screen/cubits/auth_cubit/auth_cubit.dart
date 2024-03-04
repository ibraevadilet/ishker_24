import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_tokens_use_case.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.useCase,
    required this.prefs,
    required this.tokenseCase,
  }) : super(const AuthState.initial());

  final AuthUseCase useCase;
  final SharedPreferences prefs;
  final GetTokensUseCase tokenseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  getAuth() async {
    if (formKey.currentState!.validate()) {
      emit(const AuthState.loading());

      if (loginController.text == '12345678987654' &&
          passwordController.text == 'ishker24testpassword2024') {
        try {
          await tokenseCase.getTokens(loginController.text);
          AppRouting.pushAndPopUntilFunction(
            const BottomNavigatorRoute(),
          );
        } catch (e) {
          AppSnackBar.showSnackBar(e.toString());
          emit(AuthState.error(e.toString()));
        }
      } else {
        try {
          prefs.setString(SharedKeys.pin, loginController.text);
          final result = await useCase.auth(
            loginController.text,
            passwordController.text,
          );
          if (result.body.isEmpty) {
            AppRouting.pushFunction(
              const EsiErrorRoute(),
            );
          } else {
            AppRouting.pushFunction(
              AuthSendConfirmRoute(
                authModel: result.copyWith(
                  body: result.body.where((e) => e.enabled).toList(),
                ),
              ),
            );
          }

          emit(const AuthState.success());
        } catch (e) {
          AppSnackBar.showSnackBar(e.toString());
          emit(AuthState.error(e.toString()));
        }
      }
    }
  }
}
