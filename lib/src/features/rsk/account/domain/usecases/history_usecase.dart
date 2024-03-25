import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/rsk/account/domain/repositories/i_account_repository.dart';

import '../../data/models/history_request_model.dart';
import '../entities/history.dart';

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
    this.page = 1,
    this.size = 10,
  });

  final String account;
  final DateTime startDate;
  final DateTime endDate;
  final int page;
  final int size;

  HistoryRequestModel toModel() => HistoryRequestModel(
        account: account,
        startDate: startDate,
        endDate: endDate,
        page: page,
        size: size,
      );

  @override
  List<Object?> get props => [account, startDate, endDate, page, size];
}
