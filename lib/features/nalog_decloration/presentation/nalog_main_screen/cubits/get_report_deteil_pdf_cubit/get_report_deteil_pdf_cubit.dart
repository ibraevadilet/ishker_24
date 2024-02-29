import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/report_detail_pdf_usecase.dart';

part 'get_report_deteil_pdf_cubit.freezed.dart';
part 'get_report_deteil_pdf_state.dart';

class GetReportDeteilPdfCubit extends Cubit<GetReportDeteilPdfState> {
  GetReportDeteilPdfCubit({required this.useCase})
      : super(const GetReportDeteilPdfState.loading());

  final ReportDetailPdfUseCase useCase;

  Future<void> getReportDetailPdf(String reportId) async {
    emit(const GetReportDeteilPdfState.loading());
    try {
      final pdf = await useCase.reportDetailPdf(reportId);
      emit(GetReportDeteilPdfState.success(pdf));
    } catch (e) {
      emit(GetReportDeteilPdfState.error(e.toString()));
    }
  }
}
