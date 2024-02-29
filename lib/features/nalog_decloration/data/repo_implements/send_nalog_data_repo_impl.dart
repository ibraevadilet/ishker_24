import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/send_nalog_data_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class SendNalogDataRepoImpl implements SendNalogDataRepo {
  final Dio dio;
  SendNalogDataRepoImpl({required this.dio});

  @override
  Future<void> sendNalogData(
      Map<String, dynamic> sendModel, String type) async {
    try {
      await dio.post(
        'declaration/send',
        queryParameters: {
          "type": type,
        },
        data: sendModel,
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
