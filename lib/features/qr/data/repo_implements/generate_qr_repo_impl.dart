import 'package:dio/dio.dart';
import 'package:ishker_24/core/network/netrowk_info.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/repositories/generate_qr_repository.dart';
import 'package:ishker_24/features/qr/domain/use_cases/generate_qr_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'dart:developer' as dev;

import '../datasources/qr_remote_datasource.dart';

class GenerateQrRepoImpl implements GenerateQrRepo {
  GenerateQrRepoImpl(this._network, this._remote);

  final INetworkInfo _network;
  final IQrRemoteDataSource _remote;

  @override
  Future<Result<String, Exception>> generateQr(GenerateQrParams params) async {
    try {
      dev.log("GenerateQrRepoImpl.generateQr()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.generateQr(
        GenerateQrPostModel(
          account: params.account,
          tspName: params.tspName,
          serviceName: params.serviceName,
          comments: params.comments,
          mcc: params.mcc,
          currency: params.currency,
          amount: params.amount,
          payerNameLat: params.payerNameLat,
        ),
      );
      dev.log("GenerateQrRepoImpl.generateQr(): $response");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "GenerateQrRepoImpl.generateQr(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "GenerateQrRepoImpl.generateQr(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(Exception(e), stackTrace: s);
    }
  }
}
