import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/domain/usecases/account_info_usecase.dart';

part 'account_info_cubit.freezed.dart';
part 'account_info_state.dart';

class AccountInfoCubit extends Cubit<AccountInfoState> {
  AccountInfoCubit({required this.useCase})
      : super(const AccountInfoState.loading());

  final AccountInfoUseCase useCase;

  void load(String account) async {
    emit(const AccountInfoState.loading());

    try {
      final result = await useCase.call(account);

      emit(AccountInfoState.success(result));
    } catch (e) {
      emit(AccountInfoState.error(e.toString()));
    }
  }
}
