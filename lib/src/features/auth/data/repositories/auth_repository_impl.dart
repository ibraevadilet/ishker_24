import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/network/netrowk_info.dart';
import 'package:ishker_24/src/core/storage/user_local_data_source.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/data/models/ishker_auth_model.dart';
import 'package:ishker_24/src/features/auth/data/models/send_grnp_model.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/grnp_create_use_case.dart';

import '../../domain/entity/auth_entity.dart';
import '../../domain/entity/confirm_code_entity.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/usecases/confirm_code_usecase.dart';
import '../../domain/usecases/get_confirm_code_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/pincode_enter_usecase.dart';
import '../../domain/usecases/pincode_new_usecase.dart';
import '../../domain/usecases/pincode_set_usecase.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_request_model.dart';
import '../models/send_confirm_code_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this._network, this._remote, this._local);

  final INetworkInfo _network;
  final IAuthRemoteDataSource _remote;
  final ILocalDataSource _local;

  @override
  Future<Result<String, Exception>> exists(String deviceId) async {
    try {
      dev.log("AuthRepositoryImpl.exists($deviceId)");
      // why we remove access token?
      await _local.removeAccessToken();
      await Future.delayed(Duration.zero);

      if (!await _network.isConnected) throw NoConnectionException();

      final response = await _remote.exists(deviceId);
      dev.log("AuthRepositoryImpl.exists($deviceId): success");

      if (response.isNotEmpty) {
        await _local.cachePin(response);

        return Success(response);
      } else {
        await _local.clear();

        return Failure(UserNotExistsException());
      }
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.exists($deviceId): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.exists($deviceId): catch",
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
  Future<Result<AuthEntity, Exception>> auth(LoginParams params) async {
    try {
      dev.log("AuthRepositoryImpl.auth()");

      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.auth(
        AuthRequestBody(
          username: params.login,
          password: params.password,
          deviceId: params.deviceId,
          deviceName: params.deviceName,
        ),
      );
      await _local.cachePin(params.login);
      dev.log("AuthRepositoryImpl.auth(): Success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.auth() : DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log("AuthRepositoryImpl.auth() : catch", error: e, stackTrace: s);

      return Failure(e is Exception ? e : Exception(e), stackTrace: s);
    }
  }

  @override
  Future<Result<String, Exception>> terms(String path) async {
    try {
      dev.log("AuthRepositoryImpl.terms()");

      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.esiaGetTerms(path);
      dev.log("AuthRepositoryImpl.terms(): Success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.terms() : DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log("AuthRepositoryImpl.terms() : catch", error: e, stackTrace: s);

      return Failure(e is Exception ? e : Exception(e), stackTrace: s);
    }
  }

  @override
  Future<Result<void, Exception>> getConfirmCode(
    GetConfirmCodeParams params,
  ) async {
    try {
      dev.log("AuthRepositoryImpl.getConfirmCode()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.getConfirmCode(
        params.method,
        params.token,
      );

      dev.log("AuthRepositoryImpl.getConfirmCode(): success");
      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.getConfirmCode(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.getConfirmCode(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<void, Exception>> cachePin(String pin) async {
    try {
      dev.log("AuthRepositoryImpl.cachePin($pin)");
      final response = await _local.cachePin(pin);
      dev.log("AuthRepositoryImpl.cachePin($pin): Success");

      return Success(response);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.cachePin($pin) : catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e), stackTrace: s);
    }
  }

  @override
  Future<String?> get pinCached async => _local.pin;

  @override
  Future<String?> get pinCodeCached async => _local.pinCode;

  @override
  Future<Result<void, Exception>> pinCodeSet(PinCodeSetParams params) async {
    try {
      dev.log("AuthRepositoryImpl.pinCodeSet()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.setPinCode(
        params.persistentSessionToken,
        params.code,
      );
      dev.log("AuthRepositoryImpl.pinCodeSet(): success");
      await _local.cachePinCode(params.code);

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.pinCodeSet(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.pinCodeSet(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<void, Exception>> pinCodeNew(PinCodeNewParams params) async {
    try {
      dev.log("AuthRepositoryImpl.pinCodeNew()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.pinCodeChange(
        params.deviceId,
        params.resetPinCodeToken,
        params.pinCode,
      );
      dev.log("AuthRepositoryImpl.pinCodeNew(): success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.pinCodeNew(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.pinCodeNew(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<IshkerAuthModel, Exception>> pinCodeEnter(
    PinCodeEnterParams params,
  ) async {
    try {
      dev.log("AuthRepositoryImpl.pinCodeEnter()");
      if (!await _network.isConnected) throw NoConnectionException();
      await _remote.pinCodeEnter(
        params.deviceId,
        params.pin,
        params.pinCode,
      );
      await _local.cachePinCode(params.pinCode);
      dev.log("AuthRepositoryImpl.pinCodeEnter(): success");

      // return Success(response);
      return getToken(params.deviceId, params.pin);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.pinCodeEnter(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.pinCodeEnter(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<IshkerAuthModel, Exception>> getToken(
    String deviceId,
    String pin,
  ) async {
    try {
      dev.log("AuthRepositoryImpl.getToken($deviceId, $pin)");
      if (!await _network.isConnected) throw NoConnectionException();

      final response = await _remote.getToken(deviceId, pin);
      dev.log("AuthRepositoryImpl.getToken($deviceId, $pin): success");
      await _local.cacheAccessToken(response.accessToken);
      await _local.cacheRefreshToken(response.refreshToken);

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.getToken($deviceId, $pin): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.getToken($deviceId, $pin): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<bool, Exception>> checkGRNP(String pin) async {
    try {
      dev.log("AuthRepositoryImpl.checkGRNP($pin)");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.checkGrnp(pin);

      dev.log("AuthRepositoryImpl.checkGRNP($pin): success");
      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.checkGRNP($pin): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.checkGRNP($pin): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<ConfirmCodeEntity, Exception>> confirmRecievedCode(
    ConfirmCodeParams params,
  ) async {
    try {
      dev.log("AuthRepositoryImpl.confirmRecievedCode()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.confirmCode(
        SendConfirmCodeModel(
          pin: params.pin,
          deviceId: params.deviceId,
          verificationCode: params.verificationCode,
          method: params.method,
          twoFactorSessionToken: params.twoFactorSessionToken,
        ),
      );
      dev.log("AuthRepositoryImpl.confirmRecievedCode(): success");

      return Success(response.toEntity());
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.confirmRecievedCode(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.confirmRecievedCode(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<void, Exception>> exit(String deviceId) async {
    try {
      dev.log("AuthRepositoryImpl.exit($deviceId)");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.exit(deviceId);
      await _local.clear();
      dev.log("AuthRepositoryImpl.exit($deviceId): success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.exit($deviceId): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.exit($deviceId): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<String, Exception>> sendGRNP(GrnpParams params) async {
    try {
      dev.log("AuthRepositoryImpl.sendGRNP()");
      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.sendGrnp(
        SendGRNPModel(
          pin: params.pin,
          passportSeries: params.id,
          passportNumber: params.serial,
          photo: params.photo,
        ),
        params.phone,
      );
      dev.log("AuthRepositoryImpl.sendGRNP(): success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "AuthRepositoryImpl.sendGRNP(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log(
        "AuthRepositoryImpl.sendGRNP(): catch",
        error: e,
        stackTrace: s,
      );

      return Failure(e is Exception ? e : Exception(e.toString()));
    }
  }
}
