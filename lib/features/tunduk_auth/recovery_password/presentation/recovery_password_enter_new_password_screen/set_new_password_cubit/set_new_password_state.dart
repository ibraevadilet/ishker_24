part of 'set_new_password_cubit.dart';

@freezed
class SetNewPasswordState with _$SetNewPasswordState {
  const factory SetNewPasswordState.initial() = _Initial;
  const factory SetNewPasswordState.loading() = _Loading;
  const factory SetNewPasswordState.error() = _Error;
  const factory SetNewPasswordState.success() = _Success;

  const SetNewPasswordState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
