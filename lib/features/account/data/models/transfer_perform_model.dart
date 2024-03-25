import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';

class TransferPerformModel extends Equatable {
  const TransferPerformModel({
    required this.id,
    required this.status,
    required this.message,
    required this.timestamp,
  });

  final int id;
  final int status;
  final String? message;
  final DateTime? timestamp;

  factory TransferPerformModel.fromJson(Map<String, dynamic> json) {
    log('id: ${json['id'].runtimeType}');
    log('status: ${json['status'].runtimeType}');
    return TransferPerformModel(
      id: json['id'],
      status: json['status'],
      message: json['message'],
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'])
          : null,
    );
  }

  TransferPerform toEntity() => TransferPerform(
        id: id,
        status: status,
        message: message,
        timestamp: timestamp,
      );

  @override
  List<Object?> get props => [id, status, message, timestamp];
}
