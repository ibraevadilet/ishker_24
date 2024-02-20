import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/esia_get_terms_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'esia_terms_cubit.freezed.dart';
part 'esia_terms_state.dart';

class EsiaTermsCubit extends Cubit<EsiaTermsState> {
  EsiaTermsCubit({required this.useCase})
      : super(const EsiaTermsState.initial());
  
  final EsiaGetTermsUseCase useCase;

  void esiaGetTerms() async {
    try {
      final terms = await useCase.esiaGetTerms();
      AppRouting.pushFunction(PdfViewRoute(path: terms));
      emit(const EsiaTermsState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const EsiaTermsState.error());
    }
  }
}
