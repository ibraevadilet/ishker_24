import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';

part 'download_report_pdf_cubit.freezed.dart';
part 'download_report_pdf_state.dart';

class DownloadReportPdfCubit extends Cubit<DownloadReportPdfState> {
  DownloadReportPdfCubit() : super(const DownloadReportPdfState.loading());

  Future<void> downloadPdf(int reportId) async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/report.pdf');

      Response response = await Dio().get(
        'https://app1.megacom.kg:9090/site-api5/declaration/user/declarations/$reportId',
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      await file.writeAsBytes(response.data, flush: true);
      emit(DownloadReportPdfState.success(file.path));
    } catch (e) {
      emit(DownloadReportPdfState.error(e.toString()));
    }
  }
}
