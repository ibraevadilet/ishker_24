import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/oep_signature_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'oep_signature_send_otp_cubit.freezed.dart';
part 'oep_signature_send_otp_state.dart';

class OepSignatureSendOtpCubit extends Cubit<OepSignatureSendOtpState> {
  OepSignatureSendOtpCubit({required this.useCase})
      : super(const OepSignatureSendOtpState.initial());

  final OepSignatureUseCase useCase;

  String type = '';

  Future<void> sendSms(String authType) async {
    type = authType;
    if (authType == 'email') {
      emit(const OepSignatureSendOtpState.loadingEmail());
    } else {
      emit(const OepSignatureSendOtpState.loadingEmail());
    }

    try {
      await useCase.sendOtp(authType);
      emit(const OepSignatureSendOtpState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const OepSignatureSendOtpState.error());
    }
  }

  Future<void> resend() async {
    await useCase.sendOtp(type);
  }
}
