part of 'esf_check_cubit.dart';

@freezed
class EsfCheckState with _$EsfCheckState {
  const factory EsfCheckState.loading() = _Loading;
  const factory EsfCheckState.hasToken() = _HasToken;
  const factory EsfCheckState.emptyToken() = _EmptyToken;
  const factory EsfCheckState.error(String error) = _Error;
}
