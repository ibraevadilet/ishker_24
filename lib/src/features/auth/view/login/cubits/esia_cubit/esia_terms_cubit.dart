import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/terms_usecase.dart';

part 'esia_terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit(this._usecase) : super(TermsInitial());

  final TermsUseCase _usecase;

  void load(String path) async {
    emit(TermsLoading());

    final result = await _usecase.call(path);
    emit(switch (result) {
      Success() => TermsSuccess(result.value),
      Failure() => TermsFailure(result.exception),
    });
  }
}
