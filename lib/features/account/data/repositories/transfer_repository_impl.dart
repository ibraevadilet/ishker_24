import 'package:dio/dio.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/network/netrowk_info.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/data/datasources/transfer_datasource.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_request_model.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_usecase.dart';
import 'dart:developer' as dev;

class AccountRepositoryImpl implements IAccountRepository {
  AccountRepositoryImpl(this._info, this._remote);

  final INetworkInfo _info;
  final ITransfersDataSource _remote;

  @override
  Future<Result<TransferValidate, Exception>> validate(
    TransferParams params,
  ) async {
    try {
      dev.log("AccountRepositoryImpl.validate()");
      // why we remove access token?

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.validate(
        TransferRequestModel(
          fee: params.fee,
          summa: params.summa,
          currency: params.currency,
          serviceid: params.serviceid,
          account: params.account,
          accountDt: params.accountDt,
          inn: params.inn,
        ),
      );
      dev.log("AccountRepositoryImpl.validate(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.validate(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.validate(): catch",
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
  Future<Result<TransferPerform, Exception>> perform(
    TransferParams params,
  ) async {
    try {
      dev.log("AccountRepositoryImpl.perform()");

      if (!await _info.isConnected) throw NoConnectionException();

      final response = await _remote.perform(
        TransferRequestModel(
          id: params.id,
          fee: params.fee,
          summa: params.summa,
          currency: params.currency,
          serviceid: params.serviceid,
          account: params.account,
          accountDt: params.accountDt,
          inn: params.inn,
        ),
      );
      dev.log("AccountRepositoryImpl.perform(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AccountRepositoryImpl.perform(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AccountRepositoryImpl.perform(): catch",
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
}
