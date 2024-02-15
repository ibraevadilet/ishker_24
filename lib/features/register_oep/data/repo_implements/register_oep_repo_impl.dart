// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/register_oep/data/models/send_register_oep_model.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/register_oep_repo.dart';
import 'package:ishker_24/server/catch_exception.dart';

class RegisterOEPRepoImpl implements RegisterOEPRepo {
  RegisterOEPRepoImpl({required this.dio});
  final Dio dio;

  String result = '';
  @override
  Future<String> registerOEP(SendRegisterOEPModel registerOEPModel) async {
    try {
      final response = await dio.post(
        'oep-service/register/generate',
        data: registerOEPModel.toJson(),
        options: AppDioHeader.dioHeader(),
      );
      print(response.data['code'] != null && response.data['code'] == 409);
      if (response.data['code'] != null && response.data['code'] == 409) {
        result = response.data['message'];
      }
      return result;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
