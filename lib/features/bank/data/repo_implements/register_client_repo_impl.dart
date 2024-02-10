import 'package:dio/dio.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/register_client_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class RegisterClientRepoImpl implements RegisterClientRepo {
  final Dio dio;
  RegisterClientRepoImpl({required this.dio});

  @override
  Future<void> registerClient(RegisterClientPostModel model) async {
    try {
      await dio.post(
        'rsk-service/client/register',
        data: model.toJson(),
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
