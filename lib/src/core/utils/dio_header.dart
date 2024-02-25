import 'package:dio/dio.dart';
import 'dart:convert';

class AppDioHeader {
  late String login;
  late String password;

  static Options dioHeader({String? userName, String? passWord}) => Options(
        headers: {
          'Authorization': AppEncode.encode64Basic(
            userName: userName,
            passWord: passWord,
          ),
        },
      );
}

class AppEncode {
  static String encode64Basic({String? userName, String? passWord}) {
    String username = userName ?? 'user';
    String password = passWord ?? 'user';
    return 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  }
}
