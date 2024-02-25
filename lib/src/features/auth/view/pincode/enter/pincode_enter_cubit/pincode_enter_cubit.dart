import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_cached_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_enter_usecase.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';

part 'pincode_enter_state.dart';

class PinCodeEnterCubit extends Cubit<PinCodeEnterState> {
  PinCodeEnterCubit({
    required AuthCubit authCubit,
    required PinCodeCachedUseCase pinCodeCachedUseCase,
    required PinCodeEnterUseCase pinCodeEnterUseCase,
  })  : _authCubit = authCubit,
        _pinCodeEnterUseCase = pinCodeEnterUseCase,
        _pin = authCubit.state.pin,
        super(PinCodeEnterInitial()) {
    _authSubscription = _authCubit.stream.listen((event) => _pin = event.pin);
  }

  final AuthCubit _authCubit;
  final PinCodeEnterUseCase _pinCodeEnterUseCase;

  late StreamSubscription<AuthState> _authSubscription;
  String _pin;

  @override
  Future<void> close() {
    _authSubscription.cancel();

    return super.close();
  }

  void send(String pinCode) async {
    emit(PinCodeEnterLoading());

    log('pin: $_pin');
    if (_pin.isNotEmpty) {
      final result = await _pinCodeEnterUseCase.call(
        PinCodeEnterParams(
          deviceId: _authCubit.deviceInfo.id,
          pin: _pin,
          pinCode: pinCode,
        ),
      );

      switch (result) {
        case Success():
          _authCubit.success(result.value);
          emit(PinCodeEnterSuccess());
        case Failure():
          emit(PinCodeEnterFailure(result.exception));
      }
    }
  }
}
