import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/qr_data.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2i_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2i_usecase.dart';

part 'transfer_i2i_state.dart';

class TransferI2ICubit extends Cubit<TransferI2IState> {
  TransferI2ICubit({
    required this.account,
    required TransferValidateI2IUseCase validateI2IUseCase,
    required TransferPerformI2IUseCase performI2IUseCase,
  })  : _validateI2IUseCase = validateI2IUseCase,
        _performI2IUseCase = performI2IUseCase,
        super(I2IInitial());

  final Account account;
  final TransferValidateI2IUseCase _validateI2IUseCase;
  final TransferPerformI2IUseCase _performI2IUseCase;

  late QrData qrData;

  void scanned(String qr) async {
    try {
      qrData = QrData.fromQr(qr);
      emit(
          // qrData.link.contains('ishker')
          //   ?
          I2IScanned(qrData)
          // : I2IFailure(MessageException('QR не принадлежит ишкеру'))
          );
    } catch (_) {
      emit(I2IFailure(MessageException('Unsupported QR')));
    }
  }

  void validate(int summa) async {
    emit(I2ILoading());

    final params = TransferValidateI2IParams(
      summa: summa,
      fee: 0,
      currency: account.currency,
      account: qrData.account,
      accountDt: account.account,
    );

    final result = await _validateI2IUseCase.call(params);

    emit(switch (result) {
      Success() => I2IValidated(
          result.value,
          TransferPerformI2IParams(
            summa: summa,
            fee: params.fee,
            currency: params.currency,
            account: params.account,
            accountDt: params.accountDt,
            id: result.value.id,
          ),
        ),
      Failure() => I2IFailure(result.exception),
    });
  }

  void perform(TransferPerformI2IParams params) async {
    emit(I2ILoading());

    final result = await _performI2IUseCase.call(params);

    emit(switch (result) {
      Success() => I2IPerformed(result.value),
      Failure() => I2IFailure(result.exception),
    });
  }
}
