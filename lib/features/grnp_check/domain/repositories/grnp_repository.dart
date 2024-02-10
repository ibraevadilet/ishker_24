import 'package:ishker_24/features/grnp_check/data/models/send_grnp_model.dart';

abstract class GRNPRepo {
  Future<String> sendGRNP(
    SendGRNPModel sendGRNPModel, {
    required String phone,
  });
}
