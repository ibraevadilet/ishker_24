import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_kkm_list_usecase.dart';

part 'get_kkm_list_cubit.freezed.dart';
part 'get_kkm_list_state.dart';

class MegaKassaGetKkmListCubit extends Cubit<MegaKassaGetKkmListState> {
  MegaKassaGetKkmListCubit({required this.useCase})
      : super(const MegaKassaGetKkmListState.loading()) {
    getKkmList();
  }

  final MegaKassaGetKkmListUseCase useCase;

  Future<void> getKkmList() async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      final data = await useCase.getKkmList();

      if (data?.isEmpty ?? true) {
        emit(const MegaKassaGetKkmListState.empty());
      } else {
        emit(MegaKassaGetKkmListState.success(kkms: data ?? []));
      }
    } catch (e) {
      emit(MegaKassaGetKkmListState.error(e.toString()));
    }
  }
}
