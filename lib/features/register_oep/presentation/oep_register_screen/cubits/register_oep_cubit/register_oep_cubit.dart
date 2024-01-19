import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_oep/data/models/send_register_oep_model.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/register_oep_use_case.dart';

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
        await useCase.registerOEP(
          SendRegisterOEPModel(
            pin: useCase.innController.text,
            phone: useCase.phoneNumber.text,
            esiaAccepted: true,
            passportSeries: useCase.idController.text,
            passportNumber: useCase.passNumberController.text,
            email: useCase.emailController.text,
            photo: useCase.photo,
          ),
        );
        emit(const RegisterOepState.success());
      } catch (e) {
        emit(RegisterOepState.error(e.toString()));
      }
    }
  }

  void getIsChecked(bool isCheckedFrom) {
    useCase.isChecked = isCheckedFrom;
  }

  void getPhoto(String photoFrom) {
    print(useCase.innController.text);
    print(useCase.phoneNumber.text);
    print(useCase.idController.text);
    print(useCase.passNumberController.text);
    print(useCase.emailController.text);
    print(photoFrom);
    useCase.photo = photoFrom;
  }

  @override
  Future<void> close() {
    useCase.emailController.dispose();
    useCase.passNumberController.dispose();
    useCase.innController.dispose();
    useCase.phoneNumber.dispose();
    useCase.idController.dispose();
    return super.close();
  }
}
