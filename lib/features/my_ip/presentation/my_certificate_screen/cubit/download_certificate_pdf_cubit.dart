import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:printing/printing.dart';

part 'download_certificate_pdf_cubit.freezed.dart';
part 'download_certificate_pdf_state.dart';

class DownloadCertificatePdfCubit extends Cubit<DownloadCertificatePdfState> {
  DownloadCertificatePdfCubit()
      : super(const DownloadCertificatePdfState.loading());

  Future<void> downloadPdf(String pdfUrl) async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/certificate.pdf');

      Response response = await Dio().get(
        pdfUrl,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      await file.writeAsBytes(response.data, flush: true);
      emit(DownloadCertificatePdfState.success(file.path));
    } catch (e) {
      emit(DownloadCertificatePdfState.error(e.toString()));
    }
  }
}
