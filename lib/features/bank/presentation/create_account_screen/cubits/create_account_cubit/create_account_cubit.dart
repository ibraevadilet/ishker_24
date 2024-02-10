import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bank/domain/use_cases/create_account_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';

part 'create_account_cubit.freezed.dart';
part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({required this.useCase})
      : super(const CreateAccountState.initial());

  final CreateAccountUseCase useCase;

  Future<void> createAccount(String partyId) async {
    emit(const CreateAccountState.loading());
    try {
      await useCase.createAccount(partyId);
      AppRouting.pushAndPopUntilFunction(const CreateAccountFinishRoute());
      emit(const CreateAccountState.success());
    } catch (e) {
      emit(CreateAccountState.error(e.toString()));
    }
  }
}
