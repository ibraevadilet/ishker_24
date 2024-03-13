import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2p_usecase.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit({
    required TransferPerformI2PUseCase performUseCase,
  })  : _performUseCase = performUseCase,
        super(TransferInitial());

  final TransferPerformI2PUseCase _performUseCase;

  void perform(TransferPerformI2PParams params) async {
    emit(TransferLoading());

    final result = await _performUseCase.call(params);

    emit(switch (result) {
      Success() => TransferSuccess(result.value),
      Failure() => TransferFailure(result.exception),
    });
  }
}
