import 'package:equatable/equatable.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_perform.dart';

class TransferPerformModel extends Equatable {
  const TransferPerformModel({
    required this.id,
    required this.status,
    required this.message,
    required this.timestamp,
  });

  final String id;
  final String status;
  final String message;
  final DateTime? timestamp;

  factory TransferPerformModel.fromJson(Map<String, dynamic> json) =>
      TransferPerformModel(
        id: json['id'],
        status: json['status'],
        message: json['message'],
        timestamp: DateTime.tryParse(json['timestamp']),
      );

  TransferPerform toEntity() => TransferPerform(
        id: id,
        status: status,
        message: message,
        timestamp: timestamp,
      );

  @override
  List<Object?> get props => [id, status, message, timestamp];
}
