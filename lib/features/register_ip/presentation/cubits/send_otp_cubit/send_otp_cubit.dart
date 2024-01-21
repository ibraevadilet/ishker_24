import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/send_otp_usecase.dart';

part 'send_otp_cubit.freezed.dart';
part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit({required this.useCase}) : super(const SendOtpState.initial());

  final SendOtpUseCase useCase;

  Future<void> sendOtp(String authType, [bool isNewOpen = true]) async {
    if (authType == 'email') {
      emit(const SendOtpState.emailLoading());
    } else {
      emit(const SendOtpState.smsLoading());
    }
    try {
      await useCase.sendOtp(authType);
      emit(SendOtpState.success(authType, isNewOpen));
    } catch (e) {
      emit(SendOtpState.error(e.toString()));
    }
  }
}
