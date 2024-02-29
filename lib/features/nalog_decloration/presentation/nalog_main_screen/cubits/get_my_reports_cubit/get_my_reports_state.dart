part of 'get_my_reports_cubit.dart';

@freezed
class GetMyReportsState with _$GetMyReportsState {
  const factory GetMyReportsState.loading() = _Loading;
  const factory GetMyReportsState.error(String error) = _Error;
  const factory GetMyReportsState.success(List<ReportDoneModel> model) =
      _Success;
}
