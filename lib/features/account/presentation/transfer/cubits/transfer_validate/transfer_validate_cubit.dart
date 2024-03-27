import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2p_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2p_usecase.dart';

part 'transfer_validate_state.dart';

class TransferValidateCubit extends Cubit<TransferValidateState> {
  TransferValidateCubit({
    required this.account,
    required this.inn,
    required TransferValidateI2PUseCase validateUseCase,
  })  : _validateUseCase = validateUseCase,
        super(TrValidateInitial());

  final TransferValidateI2PUseCase _validateUseCase;

  final String inn;
  final Account account;

  void reset() => emit(TrValidateInitial());

  void validate(String card, int summa) async {
    emit(TrValidateLoading());

    final params = TransferValidateI2PParams(
      summa: summa,
      fee: 0,
      currency: account.currency,
      account: card,
      accountDt: account.account,
      inn: inn,
    );

    final result = await _validateUseCase.call(params);

    emit(switch (result) {
      Success() => TrValidateSuccess(
          result.value,
          TransferPerformI2PParams(
            summa: summa,
            fee: params.fee,
            currency: params.currency,
            account: params.account,
            accountDt: params.accountDt,
            id: result.value.id,
            inn: inn,
          ),
        ),
      Failure() => TrValidateFailure(result.exception),
    });
  }
}
