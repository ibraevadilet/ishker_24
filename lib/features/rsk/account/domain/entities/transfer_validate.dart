import 'package:equatable/equatable.dart';

class TransferValidate extends Equatable {
  const TransferValidate({
    required this.id,
    required this.status,
    required this.fio,
    required this.account,
  });

  final int id;
  final int status;
  final String fio;
  final String account;

  static const empty = TransferValidate(id: 0, status: 0, fio: '', account: '');

  @override
  List<Object?> get props => [id, status, fio, account];
}
