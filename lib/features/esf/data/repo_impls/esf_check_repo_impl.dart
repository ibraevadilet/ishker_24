import 'package:dio/dio.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_check_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class EsfCheckRepoImpl implements EsfCheckRepo {
  EsfCheckRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<bool> esfCheck(String tin) async {
    try {
      final response = await dio.get(
        'gns/api/v1/check',
        queryParameters: {
          'tin': tin,
        },
      );
      return response.data;
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }
}
