import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/register_oep/data/models/send_register_oep_model.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/register_oep_repo.dart';
import 'package:ishker_24/server/catch_exception.dart';

class RegisterOEPRepoImpl implements RegisterOEPRepo {
  RegisterOEPRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<void> registerOEP(SendRegisterOEPModel registerOEPModel) async {
    try {
      await dio.post(
        'oep-service/register/generate',
        data: registerOEPModel.toJson(),
        options: AppDioHeader.dioHeader(),
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
