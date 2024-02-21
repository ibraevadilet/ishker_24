import 'package:dio/dio.dart';
import 'package:ishker_24/features/bank/domain/repositories/create_account_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class CreateAccountRepoImpl implements CreateAccountRepo {
  final Dio dio;
  CreateAccountRepoImpl({required this.dio});

  @override
  Future<String> createAccount(String partyId, String bic) async {
    try {
      final responce = await dio.post(
        'rsk-service/account/create',
        data: {
          'partyId': partyId,
          'bic': bic,
        },
      );
      return responce.data['data']?['accountNumber'] ?? '';
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
