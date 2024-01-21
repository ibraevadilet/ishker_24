import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/send_otp_usecase.dart';

part 'confirm_otp_cubit.freezed.dart';
part 'confirm_otp_state.dart';

class ConfirmOtpCubit extends Cubit<ConfirmOtpState> {
  ConfirmOtpCubit({required this.useCase})
      : super(const ConfirmOtpState.initial());

  final SendOtpUseCase useCase;

  Future<void> confirmOtp(String pinCode) async {
    emit(const ConfirmOtpState.loading());
    try {
      final result = await useCase.confirmOtp(pinCode);
      if (result == 'SUCCESS') {
        emit(const ConfirmOtpState.success());
      } else {
        emit(ConfirmOtpState.error(result));
      }
    } catch (e) {
      emit(ConfirmOtpState.error(e.toString()));
    }
  }
}
