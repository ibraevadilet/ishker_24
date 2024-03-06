import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/check_oep_usecase.dart';

part 'check_oep_cubit.freezed.dart';
part 'check_oep_state.dart';

class CheckOepCubit extends Cubit<CheckOepState> {
  CheckOepCubit({required this.useCase})
      : super(const CheckOepState.loading()) {
    checkOep();
  }
  final CheckOepUseCase useCase;

  Future<void> checkOep() async {
    try {
      await useCase.checkOep();
      emit(const CheckOepState.success());
    } catch (e) {
      if (e.toString().contains('не зарегистрирована в системе')) {
        emit(const CheckOepState.emptyOep());
      } else {
        emit(CheckOepState.error(e.toString()));
      }
    }
  }
}
