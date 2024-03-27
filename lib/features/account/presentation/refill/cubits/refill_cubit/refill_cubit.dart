import 'dart:async';
import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/account/domain/entities/qr_data.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/get_client_info_cubit/get_client_info_cubit.dart';

part 'refill_state.dart';

class RefillCubit extends Cubit<RefillState> {
  RefillCubit({
    required QrData qrData,
    required GetClientInfoCubit infoCubit,
  })  : accounts = infoCubit.state.maybeWhen(
          orElse: () => [],
          success: (model) => model.accountsList,
        ),
        super(RefillState(qrData: qrData)) {
    _infoSubscription = infoCubit.stream.listen(
      (event) {
        event.maybeWhen(
          orElse: () {},
          success: (model) => accounts = model.accountsList,
        );
      },
    );
  }

  late StreamSubscription _infoSubscription;

  List<AccountChetModel> accounts;

  @override
  Future<void> close() {
    _infoSubscription.cancel();

    return super.close();
  }
}
