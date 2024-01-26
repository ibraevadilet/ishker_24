import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.useCase}) : super(const AuthState.initial());

  final AuthUseCase useCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginController = TextEditingController(text: '21605200001255');
  final passwordController = TextEditingController(text: 'wefaf');

  getAuth() async {
    if (formKey.currentState!.validate()) {
      emit(const AuthState.loading());
      try {
        final result = await useCase.auth(
          loginController.text,
          passwordController.text,
        );
        AppRouting.pushFunction(AuthSendConfirmRoute(authModel: result));
      } catch (e) {
        AppSnackBar.showSnackBar(e.toString());
        emit(AuthState.error(e.toString()));
      }
    }
  }
}
