import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/use_cases/create_account_usecase.dart';
import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';

import '../../../../../splash/domain/use_cases/exists_user_usecase.dart';

part 'regitser_client_cubit.freezed.dart';
part 'regitser_client_state.dart';

class RegitserClientCubit extends Cubit<RegitserClientState> {
  RegitserClientCubit({
    required this.useCase,
    required this.accountUseCase,
  }) : super(const RegitserClientState.initial());
  final RegisterClientUseCase useCase;
  final CreateAccountUseCase accountUseCase;

  Future<void> registerClient(String bic) async {
    emit(const RegitserClientState.loading());
    try {
      final number = useCase.numberController.text
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll(' ', '')
          .replaceAll('-', '');
      String savedPin = sl<ExistsUserUseCase>().pin;
      if (savedPin.isEmpty) {
        savedPin = sl<AuthUseCase>().inn;
      }
      final postModel = RegisterClientPostModel(
        pin: savedPin,
        phoneNumber: '+996$number',
        emailAdress: useCase.emailController.text,
        comment: useCase.commentController.text,
        vidDeatelnosti: useCase.selectedVidDeatelnost!.text,
      );
      final result = await useCase.registerClient(postModel);
      final account = await accountUseCase.createAccount(result, bic);
      emit(const RegitserClientState.success());

      AppRouting.pushAndPopUntilFunction(
        CreateAccountFinishRoute(accountNumber: account),
      );
      useCase.disposeControllers();
    } catch (e) {
      emit(RegitserClientState.error(e.toString()));
    }
  }
}
