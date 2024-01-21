part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial(int seconds) = _Initial;
  const factory TimerState.resend() = _Resend;
}
