import 'package:equatable/equatable.dart';
import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';

class HistoryUseCase
    implements UseCase<Result<History, Exception>, HistoryParams> {
  HistoryUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<History, Exception>> call(HistoryParams params) async =>
      _repository.history(params);
}

final class HistoryParams extends Equatable {
  const HistoryParams({
    required this.account,
    required this.startDate,
    required this.endDate,
    this.page = 0,
    this.size = 10,
  });

  final String account;
  final DateTime startDate;
  final DateTime endDate;
  final int page;
  final int size;

  @override
  List<Object?> get props => [account, startDate, endDate, page, size];
}
