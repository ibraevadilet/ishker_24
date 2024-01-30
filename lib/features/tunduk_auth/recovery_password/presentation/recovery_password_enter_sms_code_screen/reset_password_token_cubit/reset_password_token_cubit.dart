import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/reset_password_token_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'reset_password_token_cubit.freezed.dart';
part 'reset_password_token_state.dart';

class ResetPasswordTokenCubit extends Cubit<ResetPasswordTokenState> {
  ResetPasswordTokenCubit({required this.useCase})
      : super(const ResetPasswordTokenState.initial());
  final ResetPasswordTokenUseCase useCase;

  final otpController = TextEditingController();

  Future<void> resetPasswordToken() async {
    if (otpController.text.length == 6) {
      emit(const ResetPasswordTokenState.loading());
      try {
        await useCase.resetPasswordToken(otpController.text);
        AppRouting.pushFunction(
          const RecoveryPasswordEnterNewPasswordRoute(),
        );
        emit(const ResetPasswordTokenState.success());
      } catch (e) {
        AppSnackBar.showSnackBar(e.toString());
        emit(const ResetPasswordTokenState.error());
      }
    }
  }
}
