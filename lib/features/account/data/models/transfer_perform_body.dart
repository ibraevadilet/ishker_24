import 'package:ishker_24/features/account/data/models/transfer_base_body.dart';

class TransferPerformI2IBody extends BaseTransferRequestBody {
  const TransferPerformI2IBody({
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
    required this.id,
    required this.numdoc,
  });

  final int id;
  final String numdoc;

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
        'id': id,
        'numdoc': numdoc,
      };

  @override
  List<Object?> get props => [id, numdoc];
}

class TransferPerformI2PBody extends BaseTransferRequestBody {
  const TransferPerformI2PBody({
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
    required this.id,
    required this.numdoc,
    required this.inn,
  });

  final int id;
  final String numdoc;
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
        'id': id,
        'numdoc': numdoc,
        'inn': inn,
      };

  @override
  List<Object?> get props => [id, numdoc, inn];
}
