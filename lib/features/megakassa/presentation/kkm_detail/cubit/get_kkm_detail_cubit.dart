import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_detail_entity.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_kkm_detail_usecase.dart';

part 'get_kkm_detail_cubit.freezed.dart';
part 'get_kkm_detail_state.dart';

class MegaKassaGetKkmDetailCubit extends Cubit<MegaKassaGetKkmDetailState> {
  MegaKassaGetKkmDetailCubit({required this.useCase})
      : super(const MegaKassaGetKkmDetailState.loading());

  final MegaKassaGetKkmDetailUseCase useCase;

  Future<void> getCashboxDetail({required String cashboxId}) async {
    try {
      emit(const MegaKassaGetKkmDetailState.loading());

      final kkmDetail = await useCase.getKkmDetail(cashboxId: cashboxId);

      emit(MegaKassaGetKkmDetailState.success(detail: kkmDetail));
    } catch (e) {
      emit(MegaKassaGetKkmDetailState.error(e.toString()));
    }
  }
}
