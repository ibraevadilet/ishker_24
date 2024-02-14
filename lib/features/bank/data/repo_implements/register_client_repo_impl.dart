import 'package:dio/dio.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/register_client_repository.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
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
      final result = responce.data['data']?['message'] ?? '';
      if (result.isNotEmpty) {
        AppSnackBar.showSnackBar(result);
        AppRouting.pushAndPopUntilFunction(const BottomNavigatorRoute());
      }
      return responce.data['data']['partyId'].toString();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
