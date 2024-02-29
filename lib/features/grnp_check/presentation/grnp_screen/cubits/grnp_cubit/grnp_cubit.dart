import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/app_helpers/encode_base_64.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/grnp_check/data/models/send_grnp_model.dart';
import 'package:ishker_24/features/grnp_check/domain/use_case/grnp_use_case.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'grnp_cubit.freezed.dart';
part 'grnp_state.dart';

class GRNPCubit extends Cubit<GRNPState> {
  GRNPCubit({required this.useCase}) : super(const GRNPState.initial());
  final GRNPUseCase useCase;

  Future<void> check() async {
    if (useCase.formKey.currentState!.validate()) {
      emit(const GRNPState.loading());
      try {
        final phone = useCase.phoneNumber.text
            .replaceAll(' ', '')
            .replaceAll('-', '')
            .replaceAll(')', '')
            .replaceAll('(', '');
        await useCase.sendGRNP(
          SendGRNPModel(
            pin: useCase.innController.text,
            passportSeries: useCase.idController.text,
            passportNumber: useCase.passNumberController.text,
            photo: useCase.photo,
          ),
          phone: '996$phone',
        );
        await Dio().get(
          AppTextConstants.savePersonalData,
          queryParameters: {
            'pin': useCase.innController.text,
          },
          options: Options(
            headers: {
              'Authorization': AppEncode.encode64Basic(),
              'token':
                  'Bearer ${sl<SharedPreferences>().getString(SharedKeys.accessToken)}',
            },
          ),
        );
        AppRouting.pushAndPopUntilFunction(const BottomNavigatorRoute());
        emit(const GRNPState.success());
      } catch (e) {
        emit(GRNPState.error(e.toString()));
        AppRouting.pushAndPopUntilFunction(const AuthRoute());
        await sl<SharedPreferences>().clear();
      }
    }
  }

  void getPhoto(String photoFrom) {
    useCase.photo = photoFrom;
  }
}
