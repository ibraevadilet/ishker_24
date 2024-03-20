import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/account.dart';
import 'package:ishker_24/features/rsk/account/domain/usecases/account_info_usecase.dart';
import 'package:ishker_24/features/rsk/client/view/client_info/client_info_cubit.dart';

part 'account_info_state.dart';

class AccountInfoCubit extends Cubit<AccountInfoState> {
  AccountInfoCubit({
    required ClientInfoCubit clientInfoCubit,
    required AccountInfoUseCase infoUseCase,
  })  : _clientInfoCubit = clientInfoCubit,
        _infoUseCase = infoUseCase,
        super(AccountInfoInitial());

  final AccountInfoUseCase _infoUseCase;

  final ClientInfoCubit _clientInfoCubit;

  void load(String account) async {
    emit(AccountInfoLoading());

    final result = await _infoUseCase.call(account);
    emit(switch (result) {
      Success() => AccountInfoSuccess(result.value),
      Failure() => AccountInfoFailure(result.exception),
    });
  }
}
