import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/qr/domain/repositories/generate_qr_repository.dart';

class GenerateQrUseCase
    implements UseCase<Result<String, Exception>, GenerateQrParams> {
  GenerateQrUseCase({required this.repo});

  final GenerateQrRepo repo;

  @override
  Future<Result<String, Exception>> call(GenerateQrParams params) async =>
      repo.generateQr(params);
}

class GenerateQrParams {
  GenerateQrParams({
    required this.account,
    required this.tspName,
    required this.serviceName,
    required this.comments,
    required this.mcc,
    required this.currency,
    required this.amount,
    required this.payerNameLat,
  });

  final String account;
  final String tspName;
  final String serviceName;
  final String comments;
  final String mcc;
  final String currency;
  final String amount;
  final String payerNameLat;
}
