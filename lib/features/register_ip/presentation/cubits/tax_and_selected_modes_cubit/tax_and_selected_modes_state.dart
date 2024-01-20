part of 'tax_and_selected_modes_cubit.dart';

@freezed
class TaxAndSelectedModesState with _$TaxAndSelectedModesState {
  const factory TaxAndSelectedModesState.loading() = _Loading;
  const factory TaxAndSelectedModesState.error(String error) = _Error;
  const factory TaxAndSelectedModesState.success(
      TaxAndSelectedModesModels model) = _Success;
}
