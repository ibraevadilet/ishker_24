import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_for_auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/auth_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class AuthRepoImpl implements AuthRepo {
  final Dio dio;
  AuthRepoImpl({required this.dio});

  @override
  Future<AuthModel> auth(SendForAuthModel model) async {
    String username = 'user';
    String password = 'user';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    try {
      final response = await dio.post(
        options: Options(
          headers: {
            'Authorization': basicAuth,
          },
        ),
        'esia/check',
        data: model.toJson(),
      );
      return AuthModel.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
