part of 'generate_pdf_review_cubit.dart';

@freezed
class GeneratePdfReviewState with _$GeneratePdfReviewState {
  const factory GeneratePdfReviewState.initial() = _Initial;
  const factory GeneratePdfReviewState.loading() = _Loading;
  const factory GeneratePdfReviewState.error() = _Error;
  const factory GeneratePdfReviewState.success(String path) = _Success;

  const GeneratePdfReviewState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
