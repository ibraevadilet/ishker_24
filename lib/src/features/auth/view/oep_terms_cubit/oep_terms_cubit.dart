import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/oep_terms_usecase.dart';

part 'oep_terms_state.dart';

class OepTermsCubit extends Cubit<OepTermsState> {
  OepTermsCubit(this._usecase) : super(OepTermsInitial());

  final OepTermsUseCase _usecase;

  void load(String path) async {
    emit(OepTermsLoading());

    final result = await _usecase.call(path);
    emit(switch (result) {
      Success() => OepTermsSuccess(result.value),
      Failure() => OepTermsFailure(result.exception),
    });
  }
}
