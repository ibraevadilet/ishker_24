import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
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
  MegaKassaRepoImpl({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: AppTextConstants.megaKassaServer,
      responseType: ResponseType.json,
      contentType: "application/json; charset=utf-8",
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
    );
  }

  String get _tin => sl<ExistsUserUseCase>().pin.isEmpty
      ? sl<AuthUseCase>().inn
      : sl<ExistsUserUseCase>().pin;
  // String get _tin => '00000522006494';

  @override
  Future<bool> getMegakassaStatus() async {
    try {
      final response = await dio.get(
        '/kkm/megakassa/client/findByTin?tin=$_tin',
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
        '/kkm/megakassa/cashBox/list?tin=$_tin',
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
        '/kkm/megakassa/getClientDetails?tin=$_tin',
      );
      return MegaKassaProfileEntity.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<(bool, MegaKassaKkmEntity?)> registerGns({
    required String pincode,
    required MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    required MegaKassaKkmRegistrationEntity? registrationKkmEntity,
  }) async {
    try {
      if (registrationEntity != null) {
        final clientGnsRegistrationRequest = await dio.get(
          '/kkm/megakassa/gnsTinValidation?tin=$_tin',
        );

        registrationEntity = registrationEntity.copyWith(
          clientGnsRegistrationRequest: {
            "login": registrationEntity.login,
            "password": registrationEntity.password,
            "legalPerson": clientGnsRegistrationRequest.data,
          },
        );

        final request = await dio.post(
          'document/kkm/client/account/auth?personIdnp=$_tin&byPin=$pincode',
          data: registrationEntity.toJson(),
        );

        return (request.data['message'] == 'Успешно', null);
      }

      if (registrationKkmEntity != null) {
        final request = await dio.post(
          'document/kkm/kkm/account/auth?personIdnp=$_tin&byPin=$pincode',
          queryParameters: registrationKkmEntity.toParams(),
          data: registrationKkmEntity.toJson(),
        );

        return (
          true,
          MegaKassaKkmEntity.fromJson(json.encode(request.data['data']))
        );
      }

      return (false, null);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<MegaKassaKkmDetailEntity> getKkmDetail({
    required String cashboxId,
  }) async {
    try {
      final response = await dio.get(
        'kkm/megakassa/cashBox/details?rnm=$cashboxId',
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
        '/kkm/megakassa/getInfo',
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
        '/kkm/megakassa/create/cashBox?tin=$_tin',
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
        '/document/kkm/methods',
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
        'document/kkm/pin/code',
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
