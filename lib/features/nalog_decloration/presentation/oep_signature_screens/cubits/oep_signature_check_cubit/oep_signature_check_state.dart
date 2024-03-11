part of 'oep_signature_check_cubit.dart';

@freezed
class OepSignatureCheckState with _$OepSignatureCheckState {
  const factory OepSignatureCheckState.loading() = _Loading;
  const factory OepSignatureCheckState.error(String error) = _Error;
  const factory OepSignatureCheckState.success(CheckOepModel model) = _Success;
}
