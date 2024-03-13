import 'package:ishker_24/features/account/data/models/transfer_base_body.dart';

class TransferValidateI2IBody extends BaseTransferRequestBody {
  const TransferValidateI2IBody({
    required super.login,
    required super.password,
    required super.timestamp,
    required super.summa,
    super.fee,
    required super.currency,
    required super.serviceid,
    required super.typeservice,
    required super.typerequest,
    required super.account,
    required super.accountDt,
  });

  @override
  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
        'timestamp': timestamp.toIso8601String(),
        'summa': summa,
        'fee': fee,
        'currency': currency,
        'serviceid': serviceid,
        'typeservice': typeservice,
        'typerequest': typerequest,
        'account': account,
        'account_dt': accountDt
      };
}

class TransferValidateI2PBody extends BaseTransferRequestBody {
  const TransferValidateI2PBody({
    required super.login,
    required super.password,
    required super.timestamp,
    required super.summa,
    super.fee,
    required super.currency,
    required super.serviceid,
    required super.typeservice,
    required super.typerequest,
    required super.account,
    required super.accountDt,
    required this.inn,
  });

  final String inn;

  @override
  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
        'timestamp': timestamp.toIso8601String(),
        'summa': summa,
        'fee': fee,
        'currency': currency,
        'serviceid': serviceid,
        'typeservice': typeservice,
        'typerequest': typerequest,
        'account': account,
        'account_dt': accountDt,
        "inn": inn,
      };

  @override
  List<Object?> get props => [inn];
}
