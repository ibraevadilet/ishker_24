import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/home/domain/use_cases/check_has_ip_use_case.dart';

part 'check_bank_cubit.freezed.dart';
part 'check_bank_state.dart';

class CheckBankCubit extends Cubit<CheckBankState> {
  CheckBankCubit({required this.useCase})
      : super(const CheckBankState.loading()) {
    checkBank();
  }

  final CheckHasIPUseCase useCase;

  Future<void> checkBank() async {
    emit(const CheckBankState.loading());
    try {
      final result = await useCase.checkHasBank();
      if (result) {
        emit(const CheckBankState.success());
      } else {
        emit(const CheckBankState.emptyBank());
      }
    } catch (e) {
      emit(CheckBankState.error(e.toString()));
    }
  }
}
