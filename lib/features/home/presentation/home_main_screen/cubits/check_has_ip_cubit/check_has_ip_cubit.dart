import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_has_ip_cubit.freezed.dart';
part 'check_has_ip_state.dart';

class CheckHasIpCubit extends Cubit<CheckHasIpState> {
  CheckHasIpCubit() : super(const CheckHasIpState.loading()) {
    checkIp();
  }

  checkIp() async {
    emit(const CheckHasIpState.loading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      emit(const CheckHasIpState.fullHas());
    } catch (e) {
      emit(CheckHasIpState.error(e.toString()));
    }
  }
}
