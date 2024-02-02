import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_pin_code_receiving_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPinCodeReceivingRepoImpl implements GetPinCodeReceivingRepo {
  final Dio dio;
  final SharedPreferences pref;
  GetPinCodeReceivingRepoImpl({required this.dio, required this.pref});

  @override
  Future<List<PinCodeTypesModel>> getPinCodeReceiving() async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      final response = await dio.get(
        'gns/pin-code-receiving',
        queryParameters: {
          'deviceId': deviceId,
        },
      );
      return response.data['data']
          .map<PinCodeTypesModel>((e) => PinCodeTypesModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
