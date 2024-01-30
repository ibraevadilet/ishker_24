part of 'confirm_received_code_cubit.dart';

@freezed
class ConfirmReceivedCodeState with _$ConfirmReceivedCodeState {
  const factory ConfirmReceivedCodeState.initial() = _Initial;
  const factory ConfirmReceivedCodeState.loading() = _Loading;
  const factory ConfirmReceivedCodeState.error(String error) = _Error;

  const ConfirmReceivedCodeState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
