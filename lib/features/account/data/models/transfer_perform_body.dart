import 'package:ishker_24/features/account/data/models/transfer_base_body.dart';

class TransferPerformI2IBody extends BaseTransferRequestBody {
  const TransferPerformI2IBody({
    required super.summa,
    super.fee,
    required super.currency,
    required super.account,
    required super.accountDt,
    required this.id,
  });

  final int id;

  @override
  Map<String, dynamic> toJson() => {
        'summa': summa,
        'fee': fee,
        'currency': currency,
        'account': account,
        'account_dt': accountDt,
        'id': id,
      };

  @override
  List<Object?> get props => [id];
}

class TransferPerformI2PBody extends BaseTransferRequestBody {
  const TransferPerformI2PBody({
    required super.summa,
    super.fee,
    required super.currency,
    required super.account,
    required super.accountDt,
    required this.id,
    required this.inn,
  });

  final int id;
  final String inn;

  @override
  Map<String, dynamic> toJson() => {
        'summa': summa,
        'fee': fee,
        'currency': currency,
        'account': account,
        'account_dt': accountDt,
        'id': id,
        'inn': inn,
      };

  @override
  List<Object?> get props => [id, inn];
}
