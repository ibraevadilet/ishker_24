import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/get_terms_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:open_filex/open_filex.dart';

part 'get_terms_cubit.freezed.dart';
part 'get_terms_state.dart';

class GetTermsCubit extends Cubit<GetTermsState> {
  GetTermsCubit({required this.useCase}) : super(const GetTermsState.initial());

  final GetTermsUseCase useCase;

  void getTerms() async {
    try {
      final terms = await useCase.getTerms();
      print(terms);
      OpenFilex.open(terms);
      emit(const GetTermsState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const GetTermsState.error());
    }
  }
}
