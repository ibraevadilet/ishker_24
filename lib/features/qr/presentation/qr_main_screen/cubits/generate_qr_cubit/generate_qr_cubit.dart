import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/domain/use_cases/get_client_info_usecase.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/use_cases/generate_qr_usecase.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_tokens_use_case.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generate_qr_cubit.freezed.dart';
part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit({
    required this.useCase,
    required this.accountsCase,
  }) : super(const GenerateQrState.loading()) {
    getAccounts();
  }

  final GenerateQrUseCase useCase;
  final GetClientInfoUseCase accountsCase;

  int amount = 0;
  String savedAccount =
      sl<SharedPreferences>().getString(SharedKeys.savedAccount) ?? '';
  final String testQrCode =
      'https://pay.payqr.kg#00020101021132500009qr.rsk.kg010141016129900337000059012021113021233440016example_tsp_name0120example_service_name5211example_mcc5316example_currency540105922example_payer_name_lat6304c4fb';
  List<AccountChetModel> accountsList = [];

  Future<void> getAccounts() async {
    try {
      final accounts = await accountsCase.getClientInfo();
      if (accounts.accountsList.isEmpty) {
        emit(GenerateQrState.emptyAccount(accounts.absId));
      } else {
        accountsList = List.from(accounts.accountsList);
        generateQr();
      }
    } catch (e) {
      emit(GenerateQrState.error(e.toString()));
    }
  }

  Future<void> generateQr({
    int? amountFrom,
    String? accountFrom,
  }) async {
    if (amountFrom != null) {
      amount = amountFrom;
    }
    log('amount: $amount');
    if (accountFrom != null) {
      savedAccount = accountFrom;
    }
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }
    try {
      final postModel = GenerateQrPostModel(
        pin: isSavedPin,
        amount: amount.toString(),
        account: savedAccount.isEmpty
            ? accountsList.first.accountNumber
            : savedAccount,
        mcc: '6538',
        currency: '417',
        comments: '',
        serviceName: '',
      );
      final pinIsTest = sl<GetTokensUseCase>().pin == '12345678987654';
      final result =
          pinIsTest ? testQrCode : await useCase.generateQr(postModel);
      emit(GenerateQrState.success(result, accountsList));
    } catch (e) {
      emit(GenerateQrState.error(e.toString()));
    }
  }
}
