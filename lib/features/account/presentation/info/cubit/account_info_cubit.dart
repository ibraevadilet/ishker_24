import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/usecases/account_info_usecase.dart';

part 'account_info_state.dart';

class AccountInfoCubit extends Cubit<AccountInfoState> {
  AccountInfoCubit(this._infoUseCase) : super(AccountInfoInitial());

  final AccountInfoUseCase _infoUseCase;

  void load(String account) async {
    emit(AccountInfoLoading());

    final result = await _infoUseCase.call(account);
    emit(switch (result) {
      Success() => AccountInfoSuccess(result.value),
      Failure() => AccountInfoFailure(result.exception),
    });
  }
}
