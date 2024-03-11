import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/check_oep_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/oep_signature_usecase.dart';

part 'oep_signature_check_cubit.freezed.dart';
part 'oep_signature_check_state.dart';

class OepSignatureCheckCubit extends Cubit<OepSignatureCheckState> {
  OepSignatureCheckCubit({required this.useCase})
      : super(const OepSignatureCheckState.loading()) {
    checkOep();
  }
  final OepSignatureUseCase useCase;

  Future<void> checkOep() async {
    try {
      final result = await useCase.checkOep();
      emit(OepSignatureCheckState.success(result));
    } catch (e) {
      emit(OepSignatureCheckState.error(e.toString()));
    }
  }
}
