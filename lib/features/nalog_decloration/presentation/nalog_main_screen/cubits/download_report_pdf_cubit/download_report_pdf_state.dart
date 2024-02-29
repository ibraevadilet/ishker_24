part of 'download_report_pdf_cubit.dart';

@freezed
class DownloadReportPdfState with _$DownloadReportPdfState {
  const factory DownloadReportPdfState.loading() = _Loading;
  const factory DownloadReportPdfState.error(String error) = _Error;
  const factory DownloadReportPdfState.success(String path) = _Success;
}
