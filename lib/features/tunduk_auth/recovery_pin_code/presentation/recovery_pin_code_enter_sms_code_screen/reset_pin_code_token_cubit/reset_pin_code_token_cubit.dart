import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/use_cases/reset_pin_code_token_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'reset_pin_code_token_cubit.freezed.dart';
part 'reset_pin_code_token_state.dart';

class ResetPinCodeTokenCubit extends Cubit<ResetPinCodeTokenState> {
  ResetPinCodeTokenCubit({required this.useCase})
      : super(const ResetPinCodeTokenState.initial());

  final ResetPinCodeTokenUseCase useCase;
  final TextEditingController controller = TextEditingController();

  Future<void> resetPinCode() async {
    if (controller.text.length == 6) {
      emit(const ResetPinCodeTokenState.loading());
      try {
        await useCase.resetPinCode(controller.text);
        AppRouting.pushFunction(PinCodeCreateRoute(isNewPin: true));
        emit(const ResetPinCodeTokenState.success());
      } catch (e) {
        AppSnackBar.showSnackBar(e.toString());
        emit(const ResetPinCodeTokenState.error());
      }
    }
  }
}
