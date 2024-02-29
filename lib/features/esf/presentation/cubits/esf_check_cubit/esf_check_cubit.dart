import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/esf/domain/usecases/esf_check_usecase.dart';

part 'esf_check_cubit.freezed.dart';
part 'esf_check_state.dart';

class EsfCheckCubit extends Cubit<EsfCheckState> {
  EsfCheckCubit({required this.useCase}) : super(const EsfCheckState.loading());

  final EsfCheckUseCase useCase;

  void esfCheck() async {
    try {
      final result = await useCase.esfCheck();
      if (result == true) {
        emit(const EsfCheckState.hasToken());
      } else {
        emit(const EsfCheckState.emptyToken());
      }
    } catch (e) {
      emit(
        EsfCheckState.error(
          e.toString(),
        ),
      );
    }
  }

  void emitHasToken() {
    emit(const EsfCheckState.hasToken());
  }
}
