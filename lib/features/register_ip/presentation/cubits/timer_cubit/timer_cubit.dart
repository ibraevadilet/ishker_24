import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_cubit.freezed.dart';
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState.initial(0));

  getTimer(int seconds) async {
    emit(TimerState.initial(seconds));
    final int ostatok = seconds - 1;
    await Future.delayed(const Duration(seconds: 1));
    if (ostatok == 0) {
      emit(const TimerState.resend());
    } else {
      emit(TimerState.initial(ostatok));
    }
  }
}
