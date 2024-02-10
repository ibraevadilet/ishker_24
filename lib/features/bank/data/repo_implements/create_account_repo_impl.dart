import 'package:dio/dio.dart';
import 'package:ishker_24/features/bank/domain/repositories/create_account_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class CreateAccountRepoImpl implements CreateAccountRepo {
  final Dio dio;
  CreateAccountRepoImpl({required this.dio});

  @override
  Future<void> createAccount(String partyId) async {
    try {
      await dio.post(
        'rsk-service/account/create',
        data: {
          'partyId': partyId,
          'bic': '129058',
        },
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
