import 'package:dio/dio.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/tax_and_selected_modes_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class TaxAndSelectedModesRepoImpl implements TaxAndSelectedModesRepo {
  final Dio dio;
  TaxAndSelectedModesRepoImpl({required this.dio});

  @override
  Future<TaxAndSelectedModesModels> taxAndSelectedModes(bool isPatent) async {
    try {
      final response = await dio.get(
        'gns/get/tax-and-selected-modes',
        queryParameters: {
          'isPatent': isPatent,
        },
      );
      return TaxAndSelectedModesModels.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
