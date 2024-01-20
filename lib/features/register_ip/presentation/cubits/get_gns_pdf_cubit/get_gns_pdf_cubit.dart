import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_gns_pdf_usecase.dart';

part 'get_gns_pdf_cubit.freezed.dart';
part 'get_gns_pdf_state.dart';

class GetGnsPdfCubit extends Cubit<GetGnsPdfState> {
  GetGnsPdfCubit({required this.useCase})
      : super(const GetGnsPdfState.loading()) {
    getGnsPdf();
  }

  final GetGnsPdfUseCase useCase;

  getGnsPdf() async {
    emit(const GetGnsPdfState.loading());
    try {
      final pdfPath = await useCase.getGnsPdf();
      emit(GetGnsPdfState.success(pdfPath));
    } catch (e) {
      emit(GetGnsPdfState.error(e.toString()));
    }
  }
}
