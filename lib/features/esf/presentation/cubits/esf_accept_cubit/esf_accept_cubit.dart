import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/esf/domain/usecases/esf_invoice_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'esf_accept_cubit.freezed.dart';
part 'esf_accept_state.dart';

class EsfAcceptCubit extends Cubit<EsfAcceptState> {
  EsfAcceptCubit({required this.useCase})
      : super(const EsfAcceptState.initial());
  final EsfInvoiceUseCase useCase;

  Future<void> esfAcceptOrReject(
    int statusCode,
    List<String> documentUuids,
  ) async {
    if (statusCode == 40) {
      emit(const EsfAcceptState.loading40());
    } else {
      emit(const EsfAcceptState.loading50());
    }
    try {
      await useCase.esfAcceptOrReject(
        documentUuids,
        statusCode,
      );
      await Future.delayed(const Duration(seconds: 3));
      if (statusCode == 40) {
        AppSnackBar.showSnackBar('Успешно принят!', isSuccess: true);
      } else {
        AppSnackBar.showSnackBar('Успешно отклонен!', isSuccess: true);
      }
      emit(const EsfAcceptState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const EsfAcceptState.error());
    }
  }
}
