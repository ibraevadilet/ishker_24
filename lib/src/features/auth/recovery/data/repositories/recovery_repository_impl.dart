import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/network/netrowk_info.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/recovery/data/datasources/recovery_datasource.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/entities/reset_pass_token.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/repositories/i_recovery_repository.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/usecases/reset_passtoken_usecase.dart';

import 'dart:developer' as dev;

import 'package:ishker_24/src/features/auth/recovery/domain/usecases/reset_password_usecase.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/usecases/set_new_password_usecase.dart';

class RecoveryRepositoryImpl implements IRecoveryRepository {
  RecoveryRepositoryImpl(this._network, this._remote);

  final INetworkInfo _network;
  final IRecoveryDataSource _remote;

  @override
  Future<Result<void, Exception>> resetPassword(
    ResetPasswordParams params,
  ) async {
    try {
      dev.log("RecoverRepositoryImpl.resetPassword()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.resetPassword(
        params.pin,
        params.contact,
        params.method,
      );
      dev.log("RecoverRepositoryImpl.resetPassword(): Success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "RecoverRepositoryImpl.resetPassword(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "RecoverRepositoryImpl.resetPassword(): catch",
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
  Future<Result<ResetPasswordToken, Exception>> resetPasswordToken(
    ResetPasswordTokenParams params,
  ) async {
    try {
      dev.log("RecoverRepositoryImpl.resetPasswordToken()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.resetPasswordToken(params.pin, params.otp);
      dev.log("RecoverRepositoryImpl.resetPasswordToken(): Success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "RecoverRepositoryImpl.resetPasswordToken(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "RecoverRepositoryImpl.resetPasswordToken(): catch",
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
  Future<Result<void, Exception>> setNewPassword(
    SetNewPasswordParams params,
  ) async {
    try {
      dev.log("RecoverRepositoryImpl.setNewPassword()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.setNewPassword(
        params.userId,
        params.token,
        params.password,
      );
      dev.log("RecoverRepositoryImpl.setNewPassword(): Success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "RecoverRepositoryImpl.setNewPassword(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "RecoverRepositoryImpl.setNewPassword(): catch",
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
