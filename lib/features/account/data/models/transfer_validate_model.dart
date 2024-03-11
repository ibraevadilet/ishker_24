import 'package:equatable/equatable.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';

class TransferValidateModel extends Equatable {
  const TransferValidateModel({
    required this.id,
    required this.status,
    required this.fio,
    required this.account,
  });

  final int id;
  final int status;
  final String fio;
  final String account;

  factory TransferValidateModel.fromJson(Map<String, dynamic> json) =>
      TransferValidateModel(
        id: json['id'],
        status: json['status'],
        fio: json['fio'],
        account: json['account'],
      );

  TransferValidate toEntity() => TransferValidate(
        id: id,
        status: status,
        fio: fio,
        account: account,
      );

  @override
  List<Object?> get props => [id, status, fio, account];
}
