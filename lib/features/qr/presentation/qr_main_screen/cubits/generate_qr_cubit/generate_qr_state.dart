part of 'generate_qr_cubit.dart';

@freezed
class GenerateQrState with _$GenerateQrState {
  const factory GenerateQrState.loading() = _Loading;
  const factory GenerateQrState.error(String error) = _Error;
  const factory GenerateQrState.success(
      String link, List<AccountChetModel> accountsList) = _Success;
  const factory GenerateQrState.emptyAccount(String partyId) = _EmptyAccount;
}
