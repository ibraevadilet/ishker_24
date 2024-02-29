part of 'send_saved_data_cubit.dart';

@freezed
class SendSavedDataState with _$SendSavedDataState {
  const factory SendSavedDataState.initial() = _Initial;
  const factory SendSavedDataState.loading() = _Loading;

  const SendSavedDataState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
