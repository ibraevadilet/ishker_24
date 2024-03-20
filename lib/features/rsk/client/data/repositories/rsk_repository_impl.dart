import 'package:dio/dio.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/network/netrowk_info.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'dart:developer' as dev;

import '../../domain/entities/client_info.dart';
import '../../domain/entities/has_ip.dart';
import '../../domain/repositories/i_rsk_reposiitory.dart';
import '../datasources/gns_datasource.dart';
import '../datasources/rsk_datasource.dart';

class RskRepositoryImpl implements IRskRepository {
  RskRepositoryImpl(this._info, this._rsk, this._gns);

  final INetworkInfo _info;
  final RskDataSource _rsk;
  final GnsDataSource _gns;

  @override
  Future<Result<ClientInfo, Exception>> clientInfo(String pin) async {
    try {
      dev.log('RskRepositoryImpl.info($pin)');
      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _rsk.info(pin);
      dev.log('RskRepositoryImpl.info($pin): success');

      return Success(response.toEntity);
    } on DioException catch (e) {
      dev.log(
        'RskRepositoryImpl.info($pin): DioException',
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        'RskRepositoryImpl.info($pin): DioException',
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
      dev.log('RskRepositoryImpl.hasIp($deviceId)');
      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _gns.hasIp(deviceId);
      dev.log('RskRepositoryImpl.hasIp($deviceId): success');

      return Success(response?.toEntity);
    } on DioException catch (e) {
      dev.log(
        'RskRepositoryImpl.hasIp($deviceId): DioException',
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        'RskRepositoryImpl.hasIp($deviceId): DioException',
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
      dev.log('RskRepositoryImpl.hasBank($pin)');
      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _rsk.hasBan(pin);
      dev.log('RskRepositoryImpl.hasBank($pin): success');

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        'RskRepositoryImpl.hasBank($pin): DioException',
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        'RskRepositoryImpl.hasBank($pin): DioException',
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
