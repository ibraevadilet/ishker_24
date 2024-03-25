import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../../domain/entities/client_info.dart';
import '../../domain/usecases/client_info_usecase.dart';

part 'client_info_state.dart';

class ClientInfoCubit extends Cubit<ClientInfoState> {
  ClientInfoCubit({
    required ClientInfoUseCase infoUseCase,
    required String pin,
  })  : _infoUseCase = infoUseCase,
        _pin = pin,
        super(ClientInfoInitial());

  final ClientInfoUseCase _infoUseCase;
  final String _pin;

  Future<void> init() async {
    emit(ClientInfoLoading());

    final result = await _infoUseCase.call(_pin);
    emit(switch (result) {
      Success() => ClientInfoSuccess(result.value),
      Failure() => ClientInfoFailure(result.exception)
    });
  }
}
