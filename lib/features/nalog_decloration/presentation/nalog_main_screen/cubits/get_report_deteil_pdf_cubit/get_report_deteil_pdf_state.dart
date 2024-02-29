part of 'get_report_deteil_pdf_cubit.dart';

@freezed
class GetReportDeteilPdfState with _$GetReportDeteilPdfState {
  const factory GetReportDeteilPdfState.loading() = _Loading;
  const factory GetReportDeteilPdfState.error(String error) = _Error;
  const factory GetReportDeteilPdfState.success(String pdf) = _Success;
}
