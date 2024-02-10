import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/home/domain/use_cases/check_has_ip_use_case.dart';

part 'check_has_ip_cubit.freezed.dart';
part 'check_has_ip_state.dart';

class CheckHasIpCubit extends Cubit<CheckHasIpState> {
  CheckHasIpCubit({required this.useCase})
      : super(const CheckHasIpState.loading());
  final CheckHasIPUseCase useCase;
  Future<void> checkIp() async {
    emit(const CheckHasIpState.loading());
    await Future.delayed(const Duration(microseconds: 300));
    try {
      final bankResult = await useCase.checkHasBank();
      // if (result.status == 1) {
      //   emit(const CheckHasIpState.emptyBank());
      // } else if (result.status == 2) {
      //   emit(const CheckHasIpState.emptyBank());
      // } else if (result.status == 3) {
      //   emit(
      //     CheckHasIpState.declinedIp(result.declinedReason ?? ''),
      //   );
      // }
      if (bankResult) {
        emit(const CheckHasIpState.fullHas());
      } else {
        emit(const CheckHasIpState.emptyBank());
      }
    } catch (e) {
      emit(CheckHasIpState.error(e.toString()));
    }
  }
}
