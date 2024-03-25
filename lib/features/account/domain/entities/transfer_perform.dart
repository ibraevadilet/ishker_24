import 'package:equatable/equatable.dart';

class TransferPerform extends Equatable {
  const TransferPerform({
    required this.id,
    required this.status,
    this.message,
    this.timestamp,
  });

  final int id;
  final int status;
  final String? message;
  final DateTime? timestamp;

  static const empty = TransferPerform(id: -1, status: -1, message: '');

  @override
  List<Object?> get props => [id, status, message, timestamp];
}
