import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/domain/use_cases/get_client_info_usecase.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/use_cases/generate_qr_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generate_qr_cubit.freezed.dart';
part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit({
    required this.useCase,
    required this.accountsCase,
  }) : super(const GenerateQrState.loading()) {
    generateQr();
  }

  final GenerateQrUseCase useCase;
  final GetClientInfoUseCase accountsCase;

  int amount = 0;
  String savedAccount =
      sl<SharedPreferences>().getString(SharedKeys.savedAccount) ?? '';

  Future<void> generateQr({
    int? amountFrom,
    String? accountFrom,
  }) async {
    if (amountFrom != null) amount = amountFrom;
    if (accountFrom != null) savedAccount = accountFrom;

    try {
      final accounts = await accountsCase.getClientInfo();
      if (accounts.accountsList.isEmpty) {
        emit(GenerateQrState.emptyAccount(accounts.absId));
      } else {
        final result = await useCase.call(
          GenerateQrParams(
            account: savedAccount.isEmpty
                ? accounts.accountsList.first.accountNumber
                : savedAccount,
            tspName: 'example_tsp_name',
            serviceName: 'example_service_name',
            comments: '',
            mcc: 'example_mcc',
            currency: 'example_currency',
            amount: amount.toString(),
            payerNameLat: 'example_payer_name_lat',
          ),
        );

        // emit(result.when(
        //   () => null,
        //   success: (value) =>
        //       GenerateQrState.success(value, accounts.accountsList),
        //   failure: (e, st) => GenerateQrState.error(e.toString()),
        // ));

        emit(switch (result) {
          Success() =>
            GenerateQrState.success(result.value, accounts.accountsList),
          Failure() => GenerateQrState.error(result.exception.toString()),
        });
      }
    } catch (e) {
      emit(GenerateQrState.error(e.toString()));
    }
  }
}
