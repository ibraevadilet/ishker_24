import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/pin_code_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'set_pin_code_cubit.freezed.dart';
part 'set_pin_code_state.dart';

class SetPinCodeCubit extends Cubit<SetPinCodeState> {
  SetPinCodeCubit({required this.useCase})
      : super(const SetPinCodeState.initial());
  final PinCodeUseCase useCase;

  Future<void> setPinCode(String pinCode) async {
    emit(const SetPinCodeState.loading());
    try {
      await useCase.setPinCode(pinCode);
      AppRouting.pushAndPopUntilFunction(const BottomNavigatorRoute());
      emit(const SetPinCodeState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(SetPinCodeState.error(e.toString()));
    }
  }

  Future<void> setNewPinCode(String pinCode) async {
    emit(const SetPinCodeState.loading());
    try {
      await useCase.setNewPinCode(pinCode);
      AppRouting.pushAndPopUntilFunction(const GrnpCheckRoute());
      emit(const SetPinCodeState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(SetPinCodeState.error(e.toString()));
    }
  }
}
