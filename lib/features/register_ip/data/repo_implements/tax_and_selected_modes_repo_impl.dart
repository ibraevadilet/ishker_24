import 'package:dio/dio.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/tax_and_selected_modes_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaxAndSelectedModesRepoImpl implements TaxAndSelectedModesRepo {
  final Dio dio;
  final SharedPreferences pref;
  TaxAndSelectedModesRepoImpl({required this.dio, required this.pref});

  @override
  Future<TaxAndSelectedModesModels> taxAndSelectedModes(bool isPatent) async {
    try {
      final response = await dio.get(
        'gns/get/tax-and-selected-modes',
        queryParameters: {
          'isPatent': isPatent,
        },
        options: Options(
          headers: {
            'authorization': 'Bearer ${pref.getString(
                  SharedKeys.accessToken,
                ) ?? ''} ',
          },
        ),
      );
      return TaxAndSelectedModesModels.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
