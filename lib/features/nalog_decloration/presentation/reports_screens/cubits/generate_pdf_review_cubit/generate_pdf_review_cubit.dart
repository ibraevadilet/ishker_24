import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/generate_pdf_review_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'generate_pdf_review_cubit.freezed.dart';
part 'generate_pdf_review_state.dart';

class GeneratePdfReviewCubit extends Cubit<GeneratePdfReviewState> {
  GeneratePdfReviewCubit({required this.useCase})
      : super(const GeneratePdfReviewState.initial());
  final GeneratePdfReviewUseCase useCase;

  Future<void> generatePdf(Map<String, dynamic> sendModel, String type) async {
    emit(const GeneratePdfReviewState.loading());
    try {
      final path = await useCase.generatePdfReview(sendModel, type);
      emit(GeneratePdfReviewState.success(path));
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const GeneratePdfReviewState.error());
    }
  }
}
