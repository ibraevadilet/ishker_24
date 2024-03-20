import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/rsk/account/domain/usecases/transfer_perform_usecase.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit({
    required TransferPerformUseCase performUseCase,
  })  : _performUseCase = performUseCase,
        super(TransferInitial());

  final TransferPerformUseCase _performUseCase;

  void perform(TransferParams params) async {
    emit(TransferLoading());

    final result = await _performUseCase.call(params);

    emit(switch (result) {
      Success() => TransferSuccess(result.value),
      Failure() => TransferFailure(result.exception),
    });
  }
}
