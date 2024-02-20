import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/esia_get_terms_usecase.dart';

part 'esia_terms_cubit.freezed.dart';
part 'esia_terms_state.dart';

class EsiaTermsCubit extends Cubit<EsiaTermsState> {
  EsiaTermsCubit({required this.useCase})
      : super(const EsiaTermsState.initial()) {
    esiaGetTerms();
  }

  final EsiaGetTermsUseCase useCase;

  void esiaGetTerms() async {
    try {
      final terms = await useCase.esiaGetTerms();
      emit(EsiaTermsState.success(terms));
    } catch (e) {
      emit(EsiaTermsState.error(e.toString()));
    }
  }
}