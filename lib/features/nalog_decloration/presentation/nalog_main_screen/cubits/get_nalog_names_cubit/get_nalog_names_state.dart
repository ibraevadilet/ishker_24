part of 'get_nalog_names_cubit.dart';

@freezed
class GetNalogNamesState with _$GetNalogNamesState {
  const factory GetNalogNamesState.loading() = _Loading;
  const factory GetNalogNamesState.error(String error) = _Error;
  const factory GetNalogNamesState.success(List<NalogNameModel> model) =
      _Success;
}
