part of 'get_gns_pdf_cubit.dart';

@freezed
class GetGnsPdfState with _$GetGnsPdfState {
  const factory GetGnsPdfState.loading() = _Loading;
  const factory GetGnsPdfState.error(String error) = _Error;
  const factory GetGnsPdfState.success(String path) = _Success;
}
