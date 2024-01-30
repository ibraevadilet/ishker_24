import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/exit_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'exit_cubit.freezed.dart';
part 'exit_state.dart';

class ExitCubit extends Cubit<ExitState> {
  ExitCubit({required this.useCase}) : super(const ExitState.initial());
  final ExitUseCase useCase;

  Future<void> exit() async {
    emit(const ExitState.loading());
    try {
      await useCase.exit();
      AppRouting.pushAndPopUntilFunction(const AuthRoute());
      emit(const ExitState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const ExitState.error());
    }
  }
}
