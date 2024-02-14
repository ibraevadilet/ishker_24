import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';

class RegisterClientPostModel {
  ///Client info
  final String pasportTypeAnId;
  final String pasportNumber;
  final String phoneNumber;
  final String emailAdress;
  final String vidDeatelnosty;

  //Ip info
  final String okpo;
  final String ogrn;
  final String seriesDocNumber;
  final String docNumber;
  final String docPlace;
  final String docDate;
  final String comment;
  final String note226;
  RegisterClientPostModel({
    required this.pasportTypeAnId,
    required this.pasportNumber,
    required this.phoneNumber,
    required this.emailAdress,
    required this.vidDeatelnosty,
    required this.okpo,
    required this.ogrn,
    required this.seriesDocNumber,
    required this.docNumber,
    required this.docPlace,
    required this.docDate,
    required this.comment,
    required this.note226,
  });

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'pasportTypeAnId': pasportTypeAnId,
  //     'pasportNumber': pasportNumber,
  //     'phoneNumber': phoneNumber,
  //     'emailAdress': emailAdress,
  //     'vidDeatelnosty': vidDeatelnosty,
  //     'okpo': okpo,
  //     'ogrn': ogrn,
  //     'seriesDocNumber': seriesDocNumber,
  //     'docNumber': docNumber,
  //     'docPlace': docPlace,
  //     'docDate': docDate,
  //   };
  // }
  Map<String, dynamic> toJson() {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }
    return <String, dynamic>{
      'pin': isSavedPin,
      'email': emailAdress,
      'mobilePhone': phoneNumber,
      'note372': comment,
      'note226': note226,
      'regDocNumber': okpo,
      'regDocSeries': ogrn,
    };
  }

  @override
  String toString() {
    return 'pin: $emailAdress, mobilePhone: $phoneNumber, comment: $comment';
  }
}
