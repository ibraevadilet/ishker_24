import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/register_oep/data/models/send_register_oep_model.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/register_oep_use_case.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_oep_cubit.freezed.dart';
part 'register_oep_state.dart';

class RegisterOepCubit extends Cubit<RegisterOepState> {
  RegisterOepCubit({required this.useCase})
      : super(const RegisterOepState.initial());

  final RegisterOEPUseCase useCase;

  Future<void> register() async {
    if (useCase.formKey.currentState!.validate()) {
      emit(const RegisterOepState.loading());
      try {
        final phone = useCase.phoneNumber.text
            .replaceAll(' ', '')
            .replaceAll('-', '')
            .replaceAll(')', '')
            .replaceAll('(', '');
        final result = await useCase.registerOEP(
          SendRegisterOEPModel(
            pin: useCase.innController.text,
            phone: '996$phone',
            esiaAccepted: true,
            passportSeries: useCase.idController.text,
            passportNumber: useCase.passNumberController.text,
            email: useCase.emailController.text,
            photo: useCase.photo,
          ),
        );

        if (result.isNotEmpty) {
          AppSnackBar.showSnackBar(result, seconds: 5);
          AppRouting.pushAndPopUntilFunction(const AuthRoute());
          useCase.innController.clear();
          useCase.idController.clear();
          useCase.passNumberController.clear();
          useCase.phoneNumber.clear();
          useCase.emailController.clear();
          sl<SharedPreferences>().clear();
        } else {
          emit(const RegisterOepState.success());
        }
      } catch (e) {
        emit(RegisterOepState.error(e.toString()));
      }
    }
  }

  void getIsChecked(bool isCheckedFrom) {
    useCase.isChecked = isCheckedFrom;
  }

  void getPhoto(String photoFrom) {
    useCase.photo = photoFrom;
  }
}
