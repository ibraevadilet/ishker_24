import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/encode_base_64.dart';

class AppDioHeader {
  static Options dioHeader({String? userName, String? passWord}) => Options(
        headers: {
          'Authorization': AppEncode.encode64Basic(
            userName: userName,
            passWord: passWord,
          ),
        },
      );
}
