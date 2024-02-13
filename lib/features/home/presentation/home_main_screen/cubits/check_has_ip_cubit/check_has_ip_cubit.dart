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
      final ipResult = await useCase.checkIp();
      if (ipResult == null) {
        emit(const CheckHasIpState.emptyIp());
      } else {
        if (ipResult.gnsStatus == 'REFUSED') {
          emit(CheckHasIpState.declinedIp(ipResult.declinedReason));
        }
        if (ipResult.gnsStatus == 'IN_PROCESS') {
          emit(const CheckHasIpState.ipInProccess());
        } else {
          final bankResult = await useCase.checkHasBank();
          if (bankResult) {
            emit(const CheckHasIpState.fullHas());
          } else {
            emit(const CheckHasIpState.emptyBank());
          }
        }
      }
    } catch (e) {
      emit(CheckHasIpState.error(e.toString()));
    }
  }
}
