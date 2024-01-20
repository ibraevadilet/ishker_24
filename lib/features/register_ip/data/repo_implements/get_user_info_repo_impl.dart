import 'package:dio/dio.dart';
import 'package:ishker_24/features/register_ip/data/models/get_user_info_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_user_info_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GetUserInfoRepoImpl implements GetUserInfoRepo {
  final Dio dio;
  GetUserInfoRepoImpl({required this.dio});

  @override
  Future<GetUserInfoModel> getUserInfo() async {
    try {
      final response = await dio.get(
        'gns/get-user-info',
      );
      return GetUserInfoModel.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
