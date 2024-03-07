import 'package:dio/dio.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/data/models/get_esf_qwery_model.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

enum ESFType { invoice, income }

class EsfInvoiceRepoImpl implements EsfInvoiceRepo {
  EsfInvoiceRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<EsfModel> esfReports(GetEsfQweryModel model) async {
    String api = '';
    if (model.type == ESFType.invoice) {
      api = 'esf/gns/api/v1/realization';
    }
    if (model.type == ESFType.income) {
      api = 'esf/gns/api/v1/income';
    }
    try {
      final response = await dio.post(
        api,
        queryParameters: model.toJson(),
      );
      return EsfModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 423) {
          showError();
          throw CatchException(message: 'Токен заблокирован').message;
        } else if (e.response!.statusCode == 500) {
          throw CatchException(message: 'Internal Server Error').message;
        } else if (e.response!.statusCode == 403) {
          throw CatchException(message: e.response!.data['message']['ru'])
              .message;
        } else {
          throw CatchException(message: e.response!.data['message']).message;
        }
      } else {
        throw CatchException(message: e.toString()).message;
      }
    }
  }

  showError() async {
    AppSnackBar.showSnackBar('Токен заблокирован');
    await Future.delayed(const Duration(seconds: 1));
    AppRouting.popUntilRootFunction();
    AppRouting.pushFunction(const EsfRoute());
  }

  @override
  Future<void> esfAcceptOrReject(
    List<String> documentUuids,
    int statusCode,
  ) async {
    final pin = AppSavedPin.getPin();
    try {
      await dio.post(
        'esf/gns/api/v1/acceptation',
        data: {
          "statusCode": statusCode,
          "documentUuids": documentUuids,
          "tin": pin,
        },
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 423) {
          showError();
          throw CatchException(message: 'Токен заблокирован').message;
        } else if (e.response!.statusCode == 500) {
          throw CatchException(message: 'Internal Server Error').message;
        } else {
          throw CatchException(message: e.response!.data['message']).message;
        }
      } else {
        throw CatchException.convertException(e).message;
      }
    }
  }

  @override
  Future<EsfStatusModel> esfSatuses() async {
    final pin = AppSavedPin.getPin();
    try {
      final response = await dio.get(
        'esf/gns/api/v1/statuses',
        queryParameters: {
          'tin': pin,
        },
      );
      return EsfStatusModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }
}
