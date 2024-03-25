import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../../domain/entities/has_ip.dart';
import '../../domain/usecases/has_bank_usecase.dart';
import '../../domain/usecases/has_ip_usecase.dart';

part 'has_ip_state.dart';

class HasIpCubit extends Cubit<HasIpState> {
  HasIpCubit({
    required HasIpUseCase hasIpUseCase,
    required HasBankUseCase hasBankUseCase,
    required String pin,
  })  : _hasIpUseCase = hasIpUseCase,
        _hasBankUseCase = hasBankUseCase,
        _pin = pin,
        super(HasIpInitial());

  final HasIpUseCase _hasIpUseCase;
  final HasBankUseCase _hasBankUseCase;
  final String _pin;

  void init(String deviceId) async {
    emit(HasIpLoading());

    final result = await _hasIpUseCase.call(deviceId);

    switch (result) {
      case Success(value: HasIP? val):
        if (val == null) {
          emit(HasIpEmpty());
        } else {
          if (val.isInProccess) {
            emit(HasIpInProgress());
          } else if (val.isRefused) {
            emit(HasIpRefused(val.declinedReason, val.created));
          } else {
            hasBank();
          }
        }

      case Failure():
        emit(HasIpFailure(result.exception));
    }
  }

  void hasBank() async {
    emit(HasIpLoading());

    final result = await _hasBankUseCase.call(_pin);

    emit(switch (result) {
      Success() => result.value ? HasIpSuccess() : HasIpEmptyBank(),
      Failure() => HasIpFailure(result.exception),
    });
  }
}
