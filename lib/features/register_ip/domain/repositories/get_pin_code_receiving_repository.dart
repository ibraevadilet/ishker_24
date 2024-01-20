import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';

abstract class GetPinCodeReceivingRepo {
  Future<List<PinCodeTypesModel>> getPinCodeReceiving();
}
