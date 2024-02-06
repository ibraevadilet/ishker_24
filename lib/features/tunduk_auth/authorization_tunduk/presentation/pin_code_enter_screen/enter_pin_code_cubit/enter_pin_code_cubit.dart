import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/pin_code_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'enter_pin_code_cubit.freezed.dart';
part 'enter_pin_code_state.dart';

class EnterPinCodeCubit extends Cubit<EnterPinCodeState> {
  EnterPinCodeCubit({required this.useCase})
      : super(const EnterPinCodeState.initial());
  final PinCodeUseCase useCase;

  int attemptCount = 0;
  int attemptCountAll = 3;
  Future<void> enterPinCode(String pinCode) async {
    attemptCount++;

    emit(const EnterPinCodeState.loading());
    try {
      await useCase.enterPinCode(pinCode);
      emit(const EnterPinCodeState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(
        e.toString() == 'user is blocked'
            ? 'Пользователь заблокирован'
            : '${e.toString()}\n Осталось попыток: ${attemptCountAll - attemptCount}',
      );
      emit(EnterPinCodeState.error(e.toString()));
    }
  }
}
