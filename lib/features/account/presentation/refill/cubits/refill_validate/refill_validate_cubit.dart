import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2i_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2i_usecase.dart';

part 'refill_validate_state.dart';

class RefillValidateCubit extends Cubit<RefillValidateState> {
  RefillValidateCubit({
    required TransferValidateI2IUseCase validateUseCase,
  })  : _validateUseCase = validateUseCase,
        super(RefillValidateInitial());

  final TransferValidateI2IUseCase _validateUseCase;

  void reset() => emit(RefillValidateInitial());

  void validate({
    required String card,
    int summa = 0,
    required String currency,
    required String accountNum,
  }) async {
    emit(RefillValidateLoading());

    final params = TransferValidateI2IParams(
      login: 'ishker',
      password: 'ishker',
      timestamp: DateTime.now(),
      summa: summa,
      fee: 0,
      currency: currency,
      serviceid: "38983092454",
      typeservice: 'ishker2pan',
      typerequest: 'validate',
      account: card,
      accountDt: accountNum,
    );

    final result = await _validateUseCase.call(params);

    emit(switch (result) {
      Success() => RefillValidateSuccess(
          result.value,
          TransferPerformI2IParams(
            login: params.login,
            password: params.password,
            timestamp: params.timestamp,
            summa: summa,
            fee: params.fee,
            currency: params.currency,
            serviceid: params.serviceid,
            typeservice: params.typeservice,
            typerequest: params.typerequest,
            account: params.account,
            accountDt: params.accountDt,
            id: result.value.id,
            //??
            numdoc: 'numdoc',
          ),
        ),
      Failure() => RefillValidateFailure(result.exception),
    });
  }
}
