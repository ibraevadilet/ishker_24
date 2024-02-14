part of 'download_certificate_pdf_cubit.dart';

@freezed
class DownloadCertificatePdfState with _$DownloadCertificatePdfState {
  const factory DownloadCertificatePdfState.loading() = _Loading;
  const factory DownloadCertificatePdfState.error(String error) = _Error;
  const factory DownloadCertificatePdfState.success(String path) = _Success;
}
