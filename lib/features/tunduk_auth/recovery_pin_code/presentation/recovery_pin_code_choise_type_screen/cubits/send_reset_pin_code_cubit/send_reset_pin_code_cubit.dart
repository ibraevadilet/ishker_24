import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/use_cases/set_reset_pin_code_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'send_reset_pin_code_cubit.freezed.dart';
part 'send_reset_pin_code_state.dart';

class SendResetPinCodeCubit extends Cubit<SendResetPinCodeState> {
  SendResetPinCodeCubit({required this.useCase})
      : super(const SendResetPinCodeState.initial());

  final SendResetPinCodeUseCase useCase;

  int attemptCount = 0;
  int attemptCountAll = 3;

  sendResetPassword(String password, String method) async {
    attemptCount++;
    if (method == 'SMS') {
      emit(const SendResetPinCodeState.loadingSms());
    } else {
      emit(const SendResetPinCodeState.loadingEmail());
    }
    try {
      final userId =
          await useCase.sendResetPinCode(password: password, method: method);
      AppRouting.pushFunction(
        RecoveryPinCodeEnterSmsCodeRoute(method: method, userId: userId),
      );
      emit(const SendResetPinCodeState.initial());
    } catch (e) {
      AppSnackBar.showSnackBar(
        e.toString() == 'Неверный пароль'
            ? '${e.toString()}\n Осталось попыток: ${attemptCountAll - attemptCount}'
            : e.toString(),
      );
      emit(const SendResetPinCodeState.error());
    }
  }
}
