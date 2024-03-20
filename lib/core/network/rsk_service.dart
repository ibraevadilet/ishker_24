import 'package:dio/dio.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/features/rsk/account/data/models/account_model.dart';
import 'package:ishker_24/features/rsk/account/data/models/history_model.dart';
import 'package:ishker_24/features/rsk/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/rsk/account/data/models/transfer_perform_model.dart';
import 'package:ishker_24/features/rsk/account/data/models/transfer_request_model.dart';
import 'package:ishker_24/features/rsk/account/data/models/transfer_validate_model.dart';
import 'package:ishker_24/features/rsk/client/data/models/client_info_model.dart';

class RskService {
  RskService(this._dio);

  final Dio _dio;

  Future<TransferValidateModel> validate(TransferRequestModel body) async {
    // final response = await _dio.post(
    //   'rsk-service/payment/card/validate',
    //   data: body.toValidateJson(),
    // );

    // return response.data['data']['link'];

    await Future.delayed(const Duration(seconds: 2));

    final data = {
      "id": 38463209,
      "status": 0,
      "fio": "И.А.Н.",
      "account": "4724144078984592"
    };

    return TransferValidateModel.fromJson(data);
  }

  Future<TransferPerformModel> perform(TransferRequestModel body) async {
    // final response = await _dio.post(
    //   'rsk-service/payment/card/perform',
    //   data: body.toPerformJson(),
    // );

    // return response.data['data']['link'];

    await Future.delayed(const Duration(seconds: 2));

    final data = {
      "id": "38463209",
      "status": "0",
      "message": "Операция завершена успешно",
      "timestamp": "2024-02-28T11:38:43+06:00",
    };

    return TransferPerformModel.fromJson(data);
  }

  Future<AccountModel> info(String account) async {
    final response = await _dio.get(
      'rsk-service/account/information',
      data: {"account": account},
    );

    final list = response.data['data'] as List;
    if (list.isNotEmpty) return AccountModel.fromJson(list.first);

    throw MessageException('Нет информации по расчетному счету');
  }

  Future<HistoryModel> history(HistoryRequestModel model) async {
    final response = await _dio.post(
      'rsk-service/payment/history',
      data: model.toJson(),
    );

    return HistoryModel.fromJson(response.data['data']);
  }

  Future<ClientInfoModel> clientInfo(String pin) async {
    final response = await _dio.post(
      'rsk-service/client/information',
      data: {'pin': pin},
    );

    return ClientInfoModel.fromJson(response.data['data']);
  }

  Future<bool> hasBank(String pin) async {
    final response = await _dio.post(
      'rsk-service/client/check',
      data: {'pin': pin},
    );

    return response.data['data']['clientExists'];
  }
}
