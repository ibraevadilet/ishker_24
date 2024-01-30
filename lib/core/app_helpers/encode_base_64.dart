import 'dart:convert';

class AppEncode {
  static String encode64Basic({String? userName, String? passWord}) {
    String username = userName ?? 'user';
    String password = passWord ?? 'user';
    return 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  }
}
