part of 'grnp_cubit.dart';

@freezed
class GRNPState with _$GRNPState {
  const factory GRNPState.initial() = _Initial;
  const factory GRNPState.loading() = _Loading;
  const factory GRNPState.error(String error) = _Error;
  const factory GRNPState.success() = _Success;
}
