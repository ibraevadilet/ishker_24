import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_pin_code_receiving_repository.dart';

class GetPinCodeReceivingUseCase {
  final GetPinCodeReceivingRepo repo;
  GetPinCodeReceivingUseCase({
    required this.repo,
  });

  Future<List<PinCodeTypesModel>> getPinCodeReceiving() async {
    try {
      return await repo.getPinCodeReceiving();
    } catch (e) {
      rethrow;
    }
  }
}
