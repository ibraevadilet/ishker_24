import 'package:dio/dio.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_pin_code_receiving_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GetPinCodeReceivingRepoImpl implements GetPinCodeReceivingRepo {
  final Dio dio;
  GetPinCodeReceivingRepoImpl({required this.dio});

  @override
  Future<List<PinCodeTypesModel>> getPinCodeReceiving() async {
    try {
      final response = await dio.get(
        'gns/pin-code-receiving',
      );
      print(response.data['data']);
      return response.data['data']
          .map<PinCodeTypesModel>((e) => PinCodeTypesModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
