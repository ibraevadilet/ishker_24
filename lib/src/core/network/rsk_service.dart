import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/account_model.dart';
import 'package:ishker_24/src/features/client/data/models/client_info_model.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/history_model.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/history_request_model.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/transfer_perform_body.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/transfer_perform_model.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/transfer_validate_body.dart';
import 'package:ishker_24/src/features/rsk/account/data/models/transfer_validate_model.dart';

class RskService {
  RskService(this._dio);

  final Dio _dio;

  Future<TransferValidateModel> validateI2I(
    TransferValidateI2IBody body,
  ) async {
    // final response = await _dio.post(
    //   'rsk-service/payment/validate',
    //   data: body.toJson(),
    // );

    // return response.data['data'];

    await Future.delayed(const Duration(seconds: 2));

    final data = {
      "id": 38463209,
      "status": 0,
      "fio": "И.А.Н.",
      "account": "4724144078984592"
    };

    return TransferValidateModel.fromJson(data);
  }

  Future<TransferValidateModel> validateI2P(
    TransferValidateI2PBody body,
  ) async {
    final response = await _dio.post(
      'rsk-service/payment/card/validate',
      data: body.toJson(),
    );

    dev.log('res: $response');

    // return TransferValidateModel.fromJson(response.data['data']);

    // await Future.delayed(const Duration(seconds: 2));

    final data = {
      "id": 38463209,
      "status": 0,
      "fio": "И.А.Н.",
      "account": "4724144078984592"
    };

    return TransferValidateModel.fromJson(data);
  }

  Future<TransferPerformModel> performI2I(TransferPerformI2IBody body) async {
    // final response = await _dio.post(
    //   'rsk-service/payment/perform',
    //   data: body.toJson(),
    // );

    // return response.data['data'];

    await Future.delayed(const Duration(seconds: 2));

    final data = {
      "id": "38463209",
      "status": "0",
      "message": "Операция завершена успешно",
      "timestamp": "2024-02-28T11:38:43+06:00",
    };

    return TransferPerformModel.fromJson(data);
  }

  Future<TransferPerformModel> performI2P(TransferPerformI2PBody body) async {
    final response = await _dio.post(
      'rsk-service/payment/card/perform',
      data: body.toJson(),
    );

    // return response.data['data'];

    // await Future.delayed(const Duration(seconds: 2));

    // final data = {
    //   "id": "38463209",
    //   "status": "0",
    //   "message": "Операция завершена успешно",
    //   "timestamp": "2024-02-28T11:38:43+06:00",
    // };

    return TransferPerformModel.fromJson(response.data['data']);
  }

  Future<AccountModel> accountInfo(String account) async {
    final response = await _dio.get(
      'rsk-service/account/information',
      data: {"account": account},
    );

    final list = response.data['data'] as List;
    if (list.isNotEmpty) return AccountModel.fromJson(list.first);

    throw MessageException('Нет информации по расчетному счету');
  }

  Future<HistoryModel> accountHistory(HistoryRequestModel model) async {
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
