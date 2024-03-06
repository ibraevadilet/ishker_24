import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_usecase.dart';

part 'transfer_validate_state.dart';

class TransferValidateCubit extends Cubit<TransferValidateState> {
  TransferValidateCubit({
    required this.accountModel,
    required this.inn,
    required TransferValidateUseCase validateUseCase,
  })  : _validateUseCase = validateUseCase,
        super(TrValidateInitial());

  final TransferValidateUseCase _validateUseCase;

  final String inn;
  final AccountModel accountModel;

  void reset() => emit(TrValidateInitial());

  void validate(String card, int summa) async {
    emit(TrValidateLoading());

    final params = TransferParams(
      summa: summa,
      currency: accountModel.currency,
      //TODO: serviceid??
      serviceid: "38983092454",
      account: card,
      accountDt: accountModel.account,
      inn: inn,
    );

    final result = await _validateUseCase.call(params);

    emit(switch (result) {
      Success() => TrValidateSuccess(
          result.value,
          params.copyWith(id: result.value.id),
        ),
      Failure() => TrValidateFailure(result.exception),
    });
  }
}
