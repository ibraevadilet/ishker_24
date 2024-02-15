import 'package:dio/dio.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/register_client_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

class RegisterClientRepoImpl implements RegisterClientRepo {
  final Dio dio;
  RegisterClientRepoImpl({required this.dio});

  @override
  Future<String> registerClient(RegisterClientPostModel model) async {
    try {
      final responce = await dio.post(
        'rsk-service/client/register',
        data: model.toJson(),
      );
      final message = responce.data['data']?['message'] ?? '';
      final reason = responce.data['data']?['reason'] ?? '';
      if (message.isNotEmpty) {
        AppSnackBar.showSnackBar(message);
      } else if (reason.isNotEmpty) {
        AppSnackBar.showSnackBar(reason);
      }
      return responce.data['data']['partyId']!.toString();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
