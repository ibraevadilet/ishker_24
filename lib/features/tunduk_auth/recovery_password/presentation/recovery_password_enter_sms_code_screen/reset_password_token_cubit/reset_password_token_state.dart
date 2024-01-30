part of 'reset_password_token_cubit.dart';

@freezed
class ResetPasswordTokenState with _$ResetPasswordTokenState {
  const factory ResetPasswordTokenState.initial() = _Initial;
  const factory ResetPasswordTokenState.loading() = _Loading;
  const factory ResetPasswordTokenState.error() = _Error;
  const factory ResetPasswordTokenState.success() = _Success;

  const ResetPasswordTokenState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
