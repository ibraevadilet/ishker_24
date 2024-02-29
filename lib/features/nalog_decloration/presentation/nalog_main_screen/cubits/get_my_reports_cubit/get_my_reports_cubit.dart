import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/my_reports_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/get_my_reports_usecase.dart';

part 'get_my_reports_cubit.freezed.dart';
part 'get_my_reports_state.dart';

class GetMyReportsCubit extends Cubit<GetMyReportsState> {
  GetMyReportsCubit({required this.useCase})
      : super(const GetMyReportsState.loading()) {
    getMyReports();
  }
  final GetMyReportsUseCase useCase;

  Future<void> getMyReports() async {
    emit(const GetMyReportsState.loading());
    try {
      final reports = await useCase.getMyReports();
      emit(GetMyReportsState.success(reports));
    } catch (e) {
      emit(GetMyReportsState.error(e.toString()));
    }
  }
}
