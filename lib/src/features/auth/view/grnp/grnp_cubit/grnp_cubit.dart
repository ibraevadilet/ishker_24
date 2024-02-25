import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/grnp_check_usecase.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';

part 'grnp_state.dart';

class GrnpCubit extends Cubit<GrnpState> {
  GrnpCubit({
    required AuthCubit authCubit,
    required GrnpCheckUseCase checkGrnpUseCase,
  })  : _checkGrnpUseCase = checkGrnpUseCase,
        _pin = authCubit.state.pin,
        super(GrnpInitial()) {
    _authSubscription = authCubit.stream.listen((event) => _pin = event.pin);
  }

  final GrnpCheckUseCase _checkGrnpUseCase;

  late StreamSubscription<AuthState> _authSubscription;
  String _pin;

  @override
  Future<void> close() {
    _authSubscription.cancel();

    return super.close();
  }

  void init() async {
    emit(GrnpLoading());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _checkGrnpUseCase.call(_pin);

    emit(switch (result) {
      Success() => GrnpSuccess(),
      Failure() => GrnpFailure(result.exception),
    });
  }
}
