import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_confirm_code_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'get_confirm_code_cubit.freezed.dart';
part 'get_confirm_code_state.dart';

class GetConfirmCodeCubit extends Cubit<GetConfirmCodeState> {
  GetConfirmCodeCubit({required this.useCase})
      : super(const GetConfirmCodeState.initial());

  final GetConfirmCodeUseCase useCase;

  Future<void> getConfirmCode({
    required String method,
    required String twoFactorSessionToken,
  }) async {
    emitLoading(method);
    try {
      await useCase.getConfirmCode(
        method: method,
        twoFactorSessionToken: twoFactorSessionToken,
      );
      AppRouting.pushFunction(const AuthConfirmCodeRoute());
      emit(const GetConfirmCodeState.initial());
    } catch (e) {
      if (e.toString() == 'sms code был отправлен') {
        AppRouting.pushFunction(const AuthConfirmCodeRoute());
        AppSnackBar.showSnackBar(e.toString());
      } else {
        AppSnackBar.showSnackBar(e.toString());
      }
      emit(GetConfirmCodeState.error(e.toString()));
    }
  }

  void emitLoading(String method) {
    switch (method) {
      case 'Telegram':
        emit(const GetConfirmCodeState.loadingTelegrem());
        break;
      case 'Email':
        emit(const GetConfirmCodeState.loadingEmail());
        break;
      case 'Sms':
        emit(const GetConfirmCodeState.loadingSms());
        break;
      default:
        emit(const GetConfirmCodeState.loadingSms());
        break;
    }
  }
}
