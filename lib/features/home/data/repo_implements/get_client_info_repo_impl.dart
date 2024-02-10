import 'package:dio/dio.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/domain/repositories/get_client_info_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GetClientInfoRepoImpl implements GetClientInfoRepo {
  final Dio dio;
  GetClientInfoRepoImpl({required this.dio});

  @override
  Future<ClientInfoModel> getClientInfo() async {
    try {
      final response = await dio.get(
        'url',
        data: {},
      );
      return ClientInfoModel.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
