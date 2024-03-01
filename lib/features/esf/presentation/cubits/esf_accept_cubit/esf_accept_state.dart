part of 'esf_accept_cubit.dart';

@freezed
class EsfAcceptState with _$EsfAcceptState {
  const factory EsfAcceptState.initial() = _Initial;
  const factory EsfAcceptState.loading40() = _Loading40;
  const factory EsfAcceptState.loading50() = _Loading50;
  const factory EsfAcceptState.error() = _Error;
  const factory EsfAcceptState.success() = _Success;

  const EsfAcceptState._();
  bool get isLoading40 => maybeWhen(
        orElse: () => false,
        loading40: () => true,
      );
  bool get isLoading50 => maybeWhen(
        orElse: () => false,
        loading50: () => true,
      );
}
