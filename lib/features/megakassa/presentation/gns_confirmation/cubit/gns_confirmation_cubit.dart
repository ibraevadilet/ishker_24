import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/gns_get_confirmation_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'gns_confirmation_cubit.freezed.dart';
part 'gns_confirmation_state.dart';

class MegaKassaGnsConfirmationCubit extends Cubit<GnsConfirmationState> {
  MegaKassaGnsConfirmationCubit({
    required this.useCase,
  }) : super(const GnsConfirmationState.initial());

  final MegaKassaGnsGetConfirmationUseCase useCase;

  Future<void> getGnsConfirmation({
    required String method,
    bool isResend = false,
  }) async {
    try {
      emit(GnsConfirmationState.loading(method: method));
      await useCase.getGnsConfirmation(method: method);
      if (isResend) {
        emit(const GnsConfirmationState.initial());
      } else {
        emit(GnsConfirmationState.success(method: method));
      }
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString(), isSuccess: false);
      emit(const GnsConfirmationState.initial());
    }
  }
}
