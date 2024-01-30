part of 'exit_cubit.dart';

@freezed
class ExitState with _$ExitState {
  const factory ExitState.initial() = _Initial;
  const factory ExitState.loading() = _Loading;
  const factory ExitState.error() = _Error;
  const factory ExitState.success() = _Success;

  const ExitState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
