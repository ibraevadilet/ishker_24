import 'package:dio/dio.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/network/netrowk_info.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/data/datasources/account_datasource.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2i_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2p_usecase.dart';
import 'dart:developer' as dev;

import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2i_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2p_usecase.dart';

class AccountRepositoryImpl implements IAccountRepository {
  AccountRepositoryImpl(this._info, this._remote);

  final INetworkInfo _info;
  final IAccountDataSource _remote;

  @override
  Future<Result<Account, Exception>> info(String account) async {
    try {
      dev.log("AccountRepositoryImpl.info($account)");

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.info(account);
      dev.log("AccountRepositoryImpl.info($account): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.history(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.history(): catch",
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
  Future<Result<History, Exception>> history(HistoryParams params) async {
    try {
      dev.log("AccountRepositoryImpl.history()");

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.history(
        HistoryRequestModel(
          account: params.account,
          startDate: params.startDate,
          endDate: params.endDate,
          page: params.page,
          size: params.size,
        ),
      );
      dev.log("AccountRepositoryImpl.history(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.history(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.history(): catch",
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
  Future<Result<TransferValidate, Exception>> validateI2P(
    TransferValidateI2PParams params,
  ) async {
    try {
      dev.log("AccountRepositoryImpl.validateI2P()");
      // why we remove access token?

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.validateI2P(params.toRequestBody());
      dev.log("AccountRepositoryImpl.validateI2P(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.validateI2P(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.validateI2P(): catch",
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
  Future<Result<TransferPerform, Exception>> performI2P(
    TransferPerformI2PParams params,
  ) async {
    try {
      dev.log("AccountRepositoryImpl.performI2P()");

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.performI2P(params.toRequestBody());
      dev.log("AccountRepositoryImpl.performI2P(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.performI2P(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.performI2P(): catch",
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
  Future<Result<TransferValidate, Exception>> validateI2I(
    TransferValidateI2IParams params,
  ) async {
    try {
      dev.log("AccountRepositoryImpl.validateI2I()");
      // why we remove access token?

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.validateI2I(params.toRequestBody());
      dev.log("AccountRepositoryImpl.validateI2I(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.validateI2I(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.validateI2I(): catch",
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
  Future<Result<TransferPerform, Exception>> performI2I(
    TransferPerformI2IParams params,
  ) async {
    try {
      dev.log("AccountRepositoryImpl.performI2I()");

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.performI2I(params.toRequestBody());
      dev.log("AccountRepositoryImpl.performI2I(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.performI2I(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.performI2I(): catch",
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
