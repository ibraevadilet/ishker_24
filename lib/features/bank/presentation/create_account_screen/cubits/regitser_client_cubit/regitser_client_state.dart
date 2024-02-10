part of 'regitser_client_cubit.dart';

@freezed
class RegitserClientState with _$RegitserClientState {
  const factory RegitserClientState.initial() = _Initial;
  const factory RegitserClientState.loading() = _Loading;
  const factory RegitserClientState.error(String error) = _Error;
  const factory RegitserClientState.success() = _Success;
}
