import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/grnp_check/data/models/send_grnp_model.dart';
import 'package:ishker_24/features/grnp_check/domain/use_case%20/grnp_use_case.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';

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
        emit(const GRNPState.success());
        AppRouting.pushAndPopUntilFunction(const BottomNavigatorRoute());
      } catch (e) {
        emit(GRNPState.error(e.toString()));
      }
    }
  }

  void getPhoto(String photoFrom) {
    useCase.photo = photoFrom;
  }
}
