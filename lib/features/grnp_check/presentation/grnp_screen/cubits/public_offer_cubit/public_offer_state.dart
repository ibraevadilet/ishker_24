part of 'public_offer_cubit.dart';

@freezed
class PublicOfferState with _$PublicOfferState {
  const factory PublicOfferState.initial() = _Initial;
  const factory PublicOfferState.error(String error) = _Error;
  const factory PublicOfferState.success(String path) = _Success;
}
