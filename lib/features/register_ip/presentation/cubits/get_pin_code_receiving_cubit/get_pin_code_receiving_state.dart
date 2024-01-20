part of 'get_pin_code_receiving_cubit.dart';

@freezed
class GetPinCodeReceivingState with _$GetPinCodeReceivingState {
  const factory GetPinCodeReceivingState.loading() = _Loading;
  const factory GetPinCodeReceivingState.error(String error) = _Error;
  const factory GetPinCodeReceivingState.success(
      List<PinCodeTypesModel> model) = _Success;
}
