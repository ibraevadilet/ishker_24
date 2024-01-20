import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/tax_and_selected_modes_usecase.dart';

part 'tax_and_selected_modes_cubit.freezed.dart';
part 'tax_and_selected_modes_state.dart';

class TaxAndSelectedModesCubit extends Cubit<TaxAndSelectedModesState> {
  TaxAndSelectedModesCubit({required this.useCase})
      : super(const TaxAndSelectedModesState.loading());
  final TaxAndSelectedModesUseCase useCase;

  Future<void> getModels(bool isPatent) async {
    emit(const TaxAndSelectedModesState.loading());
    try {
      final result = await useCase.taxAndSelectedModes(isPatent);
      emit(TaxAndSelectedModesState.success(result));
    } catch (e) {
      emit(TaxAndSelectedModesState.error(e.toString()));
    }
  }
}
