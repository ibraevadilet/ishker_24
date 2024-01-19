part of 'get_terms_cubit.dart';

@freezed
class GetTermsState with _$GetTermsState {
  const factory GetTermsState.initial() = _Initial;
  const factory GetTermsState.error() = _Error;
  const factory GetTermsState.success() = _Success;
}
