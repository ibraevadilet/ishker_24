import 'package:ishker_24/features/nalog_decloration/data/models/check_oep_model.dart';

abstract class OepSignatureRepo {
  Future<CheckOepModel> checkOep();
  Future<CheckOepModel> sendOtp(String authType);
}
