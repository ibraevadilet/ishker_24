import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_status_usecase.dart';

part 'get_megakassa_status_cubit.freezed.dart';
part 'get_megakassa_status_state.dart';

class MegaKassaGetMegaKassaStatusCubit extends Cubit<GetMegaKassaStatusState> {
  MegaKassaGetMegaKassaStatusCubit({required this.useCase})
      : super(const GetMegaKassaStatusState.loading()) {
    getMegaKassaStatus();
  }

  final MegaKassaGetStatusUseCase useCase;

  Future<void> getMegaKassaStatus() async {
    try {
      final isRegistered = await useCase.getMegakassaStatus();

      if (isRegistered) {
        emit(const GetMegaKassaStatusState.registered());
      } else {
        emit(const GetMegaKassaStatusState.unregistered());
      }
    } catch (e) {
      emit(GetMegaKassaStatusState.error(e.toString()));
    }
  }
}
