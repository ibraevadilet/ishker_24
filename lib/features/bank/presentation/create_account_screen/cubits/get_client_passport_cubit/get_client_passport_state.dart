part of 'get_client_passport_cubit.dart';

@freezed
class GetClientPassportState with _$GetClientPassportState {
  const factory GetClientPassportState.loading() = _Loading;
  const factory GetClientPassportState.error(String error) = _Error;
  const factory GetClientPassportState.success(ClientPassportModel model) =
      _Success;
}
