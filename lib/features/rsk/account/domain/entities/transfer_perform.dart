import 'package:equatable/equatable.dart';

class TransferPerform extends Equatable {
  const TransferPerform({
    required this.id,
    required this.status,
    required this.message,
    this.timestamp,
  });

  final String id;
  final String status;
  final String message;
  final DateTime? timestamp;

  static const empty = TransferPerform(id: '', status: '', message: '');

  @override
  List<Object?> get props => [id, status, message, timestamp];
}
