import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/reset_password_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.useCase})
      : super(const ResetPasswordState.initial());
  final ResetPasswordUseCase useCase;

  final pinController = TextEditingController();
  final contactController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> resetPassword(String method) async {
    if (formKey.currentState!.validate()) {
      emit(const ResetPasswordState.loading());
      String contact = contactController.text;
      if (method == 'sms') {
        contact = contactController.text
            .replaceAll(' ', '')
            .replaceAll(')', '')
            .replaceAll('(', '')
            .replaceAll('-', '');
      }
      try {
        await useCase.resetPassword(
          pin: pinController.text,
          contact: contact,
          method: method,
        );
        AppRouting.pushFunction(
          RecoveryPasswordEnterSmsCodeRoute(
            isSmsRecovery: method == 'sms',
            contact: contact,
          ),
        );
        emit(const ResetPasswordState.success());
      } catch (e) {
        AppSnackBar.showSnackBar(e.toString());
        emit(const ResetPasswordState.error());
      }
    }
  }
}
