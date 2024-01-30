import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/set_new_password_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'set_new_password_cubit.freezed.dart';
part 'set_new_password_state.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordState> {
  SetNewPasswordCubit({required this.useCase})
      : super(const SetNewPasswordState.initial());

  final SetNewPasswordUseCase useCase;

  Future<void> setNewPassword(String password) async {
    emit(const SetNewPasswordState.loading());
    try {
      await useCase.setNewPassword(password);
      emit(const SetNewPasswordState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const SetNewPasswordState.error());
    }
  }
}
