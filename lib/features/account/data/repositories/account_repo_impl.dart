import 'package:dio/dio.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/domain/repositories/account_repo.dart';
import 'package:ishker_24/server/catch_exception.dart';

class AccountRepoImpl implements AccountRepo {
  AccountRepoImpl({required this.dio});

  final Dio dio;

  @override
  Future<AccountModel> info(String account) async {
    try {
      final response = await dio.get(
        'rsk-service/account/information',
        data: {"account": account},
      );

      final list = response.data['data'] as List;
      if (list.isNotEmpty) return AccountModel.fromJson(list.first);

      throw CatchException(message: 'Нет информации по расчетному счету');
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<HistoryModel> history(HistoryRequestModel model) async {
    try {
      final response = await dio.post(
        'rsk-service/payment/history',
        data: model.toJson(),
      );

      return HistoryModel.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
