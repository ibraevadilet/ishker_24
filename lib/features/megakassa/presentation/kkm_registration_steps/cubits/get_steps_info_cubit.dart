import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_steps_info_entity.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_steps_info_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'get_steps_info_cubit.freezed.dart';
part 'get_steps_info_state.dart';

class MegaKassaGetStepsInfoCubit extends Cubit<GetStepsInfoState> {
  MegaKassaGetStepsInfoCubit({required this.useCase})
      : super(const GetStepsInfoState.initial(info: null));

  final MegaKassaGetStepsInfoUseCase useCase;

  Future<void> getStepsInfo() async {
    try {
      emit(const GetStepsInfoState.loading(info: null));
      final info = await useCase.getStepsInfo();

      emit(GetStepsInfoState.success(info: info));
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString(), isSuccess: false);
      emit(GetStepsInfoState.error(error: e.toString(), info: null));
    }
  }
}
