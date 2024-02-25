import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_set_usecase.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';

part 'pincode_create_state.dart';

class PinCodeCreateCubit extends Cubit<PinCodeCreateState> {
  PinCodeCreateCubit({
    required PinCodeSetUseCase setUseCase,
    // required PinCodeNewUseCase newUseCase,
    required AuthCubit authCubit,
  })  : _setUseCase = setUseCase,
        // _newUseCase = newUseCase,
        _authCubit = authCubit,
        super(const PinCodeCreateState());

  final PinCodeSetUseCase _setUseCase;
  // final PinCodeNewUseCase _newUseCase;

  final AuthCubit _authCubit;

  void firstPin(String code) async => emit(state.copyWith(first: code));

  void setPinCode(String code) async {
    if (code == state.first) {
      emit(state.copyWith(status: RequestLoading()));

      final result = await _setUseCase.call(PinCodeSetParams(
        persistentSessionToken: _authCubit.state.persistentToken,
        code: code,
      ));

      emit(state.copyWith(
        status: switch (result) {
          Success() => RequestSuccess(),
          Failure() => RequestFailure(result.exception),
        },
      ));
    } else {
      emit(state.copyWith(status: RequestFailure(PinCodeNotEqualException())));
    }
  }

  // Future<void> setNewPinCode(String pinCode) async {
  //   emit(state.copyWith(status: RequestLoading()));
  //   try {
  //     await _newUseCase.call(PinCodeNewParams(
  //       deviceId: _authCubit.deviceInfo.id,
  //       resetPinCodeToken: resetPinCodeToken,
  //       pinCode: pinCode,
  //     ));
  //     AppRouting.pushAndPopUntilFunction(const GrnpCheckRoute());
  //     emit(const SetPinCodeState.success());
  //   } catch (e) {
  //     AppSnackBar.showSnackBar(e.toString());
  //     emit(SetPinCodeState.error(e.toString()));
  //   }
  // }
}
