import 'package:dio/dio.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/grnp_check/data/models/send_grnp_model.dart';
import 'package:ishker_24/features/grnp_check/domain/repositories/grnp_repository.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GRNPRepoImpl implements GRNPRepo {
  GRNPRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<String> sendGRNP(
    SendGRNPModel sendGRNPModel, {
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        'grnp/passportdata',
        queryParameters: {
          'phone': phone,
        },
        data: sendGRNPModel.toJson(),
      );

      return response.data;
    } catch (e) {
      if (e == 403) {
        AppRouting.pushAndPopUntilFunction(const AuthRoute());
      }
      throw CatchException.convertException(e).message;
    }
  }
}
