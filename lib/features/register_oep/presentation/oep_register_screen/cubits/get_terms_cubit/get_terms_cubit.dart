import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/get_terms_usecase.dart';

part 'get_terms_cubit.freezed.dart';
part 'get_terms_state.dart';

class GetTermsCubit extends Cubit<GetTermsState> {
  GetTermsCubit({required this.useCase})
      : super(const GetTermsState.initial()) {
    getTerms();
  }

  final GetTermsUseCase useCase;

  void getTerms() async {
    try {
      final terms = await useCase.getTerms();

      emit(GetTermsState.success(terms));
    } catch (e) {
      emit(GetTermsState.error(e.toString()));
    }
  }
}
