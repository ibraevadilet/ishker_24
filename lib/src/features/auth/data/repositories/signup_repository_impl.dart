import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/network/netrowk_info.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/data/datasources/signup_remote_datasource.dart';
import 'package:ishker_24/src/features/auth/data/models/oep_register_model.dart';
import 'package:ishker_24/src/features/auth/domain/repositories/i_signup_repository.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/signup_usecase.dart';
import 'dart:developer' as dev;

class SignUpRepositoryImpl implements ISignUpRepository {
  SignUpRepositoryImpl(this._network, this._remote);

  final INetworkInfo _network;
  final ISignUpRemoteDataSource _remote;

  @override
  Future<Result<String, Exception>> signup(SignUpParams params) async {
    try {
      dev.log("SignUpRepositoryImpl.signup()");
      if (!await _network.isConnected) throw NoConnectionException();

      final response = await _remote.signUp(OepRegisterModel(
        pin: params.pin,
        phone: params.phone,
        esiaAccepted: params.esiaAccepted,
        passportSeries: params.passportSeries,
        passportNumber: params.passportNumber,
        email: params.email,
        photo: params.photo,
      ));
      dev.log("SignUpRepositoryImpl.signup(): Success $response");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "SignUpRepositoryImpl.signup(): DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log("SignUpRepositoryImpl.signup()");
      return Failure(
        e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<String, Exception>> terms(String path) async {
    try {
      dev.log("SignUpRepositoryImpl.terms()");

      if (!await _network.isConnected) throw NoConnectionException();
      final response = await _remote.terms(path);
      dev.log("SignUpRepositoryImpl.terms(): Success");

      return Success(response);
    } on DioException catch (e) {
      dev.log(
        "SignUpRepositoryImpl.terms() : DioException",
        error: e,
        stackTrace: e.stackTrace,
      );

      return Failure(e, stackTrace: e.stackTrace);
    } catch (e, s) {
      dev.log("SignUpRepositoryImpl.terms() : catch", error: e, stackTrace: s);

      return Failure(e is Exception ? e : Exception(e), stackTrace: s);
    }
  }
}
