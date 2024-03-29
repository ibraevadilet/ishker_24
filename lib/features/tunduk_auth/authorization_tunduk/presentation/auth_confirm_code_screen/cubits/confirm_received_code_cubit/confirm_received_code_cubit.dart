import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/confirm_received_code_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'confirm_received_code_cubit.freezed.dart';
part 'confirm_received_code_state.dart';

class ConfirmReceivedCodeCubit extends Cubit<ConfirmReceivedCodeState> {
  ConfirmReceivedCodeCubit({required this.useCase})
      : super(const ConfirmReceivedCodeState.initial());

  final ConfirmReceivedCodeUseCase useCase;
  final smsCodeController = TextEditingController();
  int attemptCount = 0;
  int attemptCountAll = 5;

  Future<void> confirmCode() async {
    if (smsCodeController.text.length == 6) {
      attemptCount++;
      emit(const ConfirmReceivedCodeState.loading());
      try {
        final result =
            await useCase.confirmReceivedCode(smsCodeController.text);
        if (result.signInResult == 'Succeeded') {
          AppRouting.pushFunction(PinCodeEnterRoute());
        } else {
          AppRouting.pushFunction(PinCodeCreateRoute());
        }
      } catch (e) {
        AppSnackBar.showSnackBar(
          e.toString() == 'Пользователь заблокирован'
              ? e.toString()
              : '${e.toString()}\n Осталось попыток: ${attemptCountAll - attemptCount}',
        );
        emit(ConfirmReceivedCodeState.error(e.toString()));
      }
    }
  }
}
