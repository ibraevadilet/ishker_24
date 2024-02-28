part of 'save_token_cubit.dart';

@freezed
class SaveTokenState with _$SaveTokenState {
  const factory SaveTokenState.initial() = _Initial;
  const factory SaveTokenState.loading() = _Loading;
  const factory SaveTokenState.success() = _Success;

  const SaveTokenState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
