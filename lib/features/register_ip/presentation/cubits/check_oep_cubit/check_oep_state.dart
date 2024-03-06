part of 'check_oep_cubit.dart';

@freezed
class CheckOepState with _$CheckOepState {
  const factory CheckOepState.loading() = _Loading;
  const factory CheckOepState.success() = _Success;
  const factory CheckOepState.error(String error) = _Error;
  const factory CheckOepState.emptyOep() = _EmptyOep;
}
