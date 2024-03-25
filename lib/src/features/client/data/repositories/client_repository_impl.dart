import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/network/netrowk_info.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../../domain/entities/client_info.dart';
import '../../domain/entities/has_ip.dart';
import '../../domain/repositories/i_client_reposiitory.dart';
import '../datasources/gns_datasource.dart';
import '../datasources/rsk_datasource.dart';

class ClientRepositoryImpl implements IClientRepository {
  ClientRepositoryImpl(this._info, this._rsk, this._gns);

  final INetworkInfo _info;
  final RskDataSource _rsk;
  final GnsDataSource _gns;

  @override
  Future<Result<ClientInfo, Exception>> clientInfo(String pin) async {
    try {
      dev.log('ClientRepositoryImpl.info($pin)');
      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _rsk.info(pin);
      dev.log('ClientRepositoryImpl.info($pin): success');

      return Success(response.toEntity);
    } on DioException catch (e) {
      dev.log(
        'ClientRepositoryImpl.info($pin): DioException',
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        'ClientRepositoryImpl.info($pin): DioException',
        error: e,
        stackTrace: s,
      );

      return Failure(
        e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<HasIP?, Exception>> hasIp(String deviceId) async {
    try {
      dev.log('ClientRepositoryImpl.hasIp($deviceId)');
      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _gns.hasIp(deviceId);
      dev.log('ClientRepositoryImpl.hasIp($deviceId): success');

      return Success(response?.toEntity);
    } on DioException catch (e) {
      dev.log(
        'ClientRepositoryImpl.hasIp($deviceId): DioException',
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        'ClientRepositoryImpl.hasIp($deviceId): DioException',
        error: e,
        stackTrace: s,
      );

      return Failure(
        e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<bool, Exception>> hasBank(String pin) async {
    try {
      dev.log('ClientRepositoryImpl.hasBank($pin)');
      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _rsk.hasBank(pin);
      dev.log('ClientRepositoryImpl.hasBank($pin): success');

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        'ClientRepositoryImpl.hasBank($pin): DioException',
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        'ClientRepositoryImpl.hasBank($pin): DioException',
        error: e,
        stackTrace: s,
      );

      return Failure(
        e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}
