import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/grnp_create_use_case.dart';

part 'grnp_create_state.dart';

class GrnpCreateCubit extends Cubit<GrnpCreateState> {
  GrnpCreateCubit(this._createaUseCase) : super(const GrnpCreateState());

  final GrnpCreateaUseCase _createaUseCase;

  void userData(
    String passSeries,
    String passNumbers,
    String pin,
    String phone,
  ) =>
      emit(state.copyWith(
        passSeries: passSeries,
        passNumbers: passNumbers,
        pin: pin,
        phone: phone,
      ));

  void create(String photo) async {
    emit(state.copyWith(status: RequestLoading()));

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createaUseCase.call(GrnpParams(
      id: state.passSeries,
      serial: state.passNumbers,
      pin: state.pin,
      phone: '996${state.phone}',
      photo: photo,
    ));

    emit(switch (result) {
      Success() => state.copyWith(status: RequestSuccess()),
      Failure() => state.copyWith(status: RequestFailure(result.exception)),
    });
  }
}
