import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';

import '../../domain/entities/client_info.dart';
import '../../domain/usecases/client_info_usecase.dart';

part 'client_info_state.dart';

class ClientInfoCubit extends Cubit<ClientInfoState> {
  ClientInfoCubit({
    required ClientInfoUseCase infoUseCase,
    required this.pin,
  })  : _infoUseCase = infoUseCase,
        super(ClientInfoInitial());

  final ClientInfoUseCase _infoUseCase;
  final String pin;

  Future<void> init() async {
    emit(ClientInfoLoading());

    final result = await _infoUseCase.call(pin);
    emit(switch (result) {
      Success() => ClientInfoSuccess(result.value),
      Failure() => ClientInfoFailure(result.exception)
    });
  }
}
