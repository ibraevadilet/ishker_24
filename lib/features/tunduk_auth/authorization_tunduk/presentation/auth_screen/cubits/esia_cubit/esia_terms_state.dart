part of 'esia_terms_cubit.dart';

@freezed
class EsiaTermsState with _$EsiaTermsState {
 const factory EsiaTermsState.initial() = _Initial;
  const factory EsiaTermsState.error() = _Error;
  const factory EsiaTermsState.success() = _Success;
}
