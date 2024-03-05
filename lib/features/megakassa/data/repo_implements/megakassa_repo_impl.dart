import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_detail_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_steps_info_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/profile_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class MegaKassaRepoImpl implements MegaKassaRepo {
  final Dio dio;

  MegaKassaRepoImpl({required this.dio});

  String get _tin => sl<ExistsUserUseCase>().pin.isEmpty
      ? sl<AuthUseCase>().inn
      : sl<ExistsUserUseCase>().pin;
  // String get _tin => '12406199101096';

  @override
  Future<bool> getMegakassaStatus() async {
    try {
      final response = await dio.get(
        'kkm/kkm/megakassa/client/findByTin?tin=$_tin',
      );
      return response.data;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<List<MegaKassaKkmEntity>?> getKkmList() async {
    try {
      final response = await dio.get(
        'kkm/kkm/megakassa/cashBox/list?tin=$_tin',
      );
      return (response.data as List)
          .map((e) => MegaKassaKkmEntity.fromMap(e))
          .toList();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<MegaKassaProfileEntity> getProfileInfo() async {
    try {
      final response = await dio.get(
        'kkm/kkm/megakassa/getClientDetails?tin=$_tin',
      );
      return MegaKassaProfileEntity.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<(String, MegaKassaKkmEntity?, int)> registerGns({
    required String pincode,
    required MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    required MegaKassaKkmRegistrationEntity? registrationKkmEntity,
  }) async {
    try {
      if (registrationEntity != null) {
        final clientGnsRegistrationRequest = await dio.get(
          'kkm/kkm/megakassa/gnsTinValidation?tin=$_tin',
        );

        registrationEntity = registrationEntity.copyWith(
          clientGnsRegistrationRequest: {
            "login": registrationEntity.login,
            "password": registrationEntity.password,
            "legalPerson": clientGnsRegistrationRequest.data,
          },
        );

        final result = await dio.post(
          'kkm/document/kkm/client/account/auth?personIdnp=$_tin&byPin=$pincode',
          data: registrationEntity.toJson(),
        );

        return ('Успешно', null, result.statusCode ?? 400);
      }

      if (registrationKkmEntity != null) {
        final request = await dio.post(
          'kkm/document/kkm/kkm/account/auth?personIdnp=$_tin&byPin=$pincode',
          // queryParameters: registrationKkmEntity.toParams(),
          data: registrationKkmEntity.toJson(),
        );

        return (
          'Успешно',
          MegaKassaKkmEntity.fromJson(json.encode(request.data['data'])),
          request.statusCode ?? 400,
        );
      }

      return ('Ошибка', null, 500);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          return (
            e.response?.data['error'].toString() ?? 'Неверный пин код',
            null,
            400
          );
        } else {
          throw CatchException.convertException(e).message;
        }
      } else {
        throw CatchException.convertException(e).message;
      }
    }
  }

  @override
  Future<MegaKassaKkmDetailEntity> getKkmDetail({
    required String cashboxId,
  }) async {
    try {
      final response = await dio.get(
        'kkm/kkm/megakassa/cashBox/details',
        queryParameters: {
          'rnm': cashboxId,
          'tin': _tin,
        },
      );
      return megaKassaKkmDetailEntityFromJson(json.encode(response.data));
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<MegaKassaStepsInfoEntity> getStepsInfo() async {
    try {
      final response = await dio.get(
        'kkm/kkm/megakassa/getInfo',
      );
      return megaKassaStep1InfoEntityFromJson(json.encode(response.data));
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<MegaKassaKkmEntity> registerKkm({
    required MegaKassaKkmRegistrationEntity registrationEntity,
  }) async {
    try {
      final request = await dio.post(
        'kkm/kkm/megakassa/create/cashBox?tin=$_tin',
        data: registrationEntity.toJson(),
      );

      return MegaKassaKkmEntity.fromJson(json.encode(request.data['data']));
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<List<PinCodeTypesModel>> getGnsMethods() async {
    try {
      final request = await dio.post(
        'kkm/document/kkm/methods',
        data: {"personIdnp": _tin},
      );

      return (request.data['userAuthMethodList'] as List)
          .map((e) => PinCodeTypesModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<bool> getGetConfirmation({required String method}) async {
    try {
      await dio.post(
        'kkm/document/kkm/pin/code',
        data: {
          "personIdnp": _tin,
          "method": method,
        },
      );

      return true;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
