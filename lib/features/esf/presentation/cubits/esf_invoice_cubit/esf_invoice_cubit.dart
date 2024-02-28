import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/domain/usecases/esf_invoice_usecase.dart';

part 'esf_invoice_cubit.freezed.dart';
part 'esf_invoice_state.dart';

class EsfInvoiceCubit extends Cubit<EsfInvoiceState> {
  EsfInvoiceCubit({required this.useCase})
      : super(const EsfInvoiceState.loading());

  final EsfInvoiceUseCase useCase;

  Future<void> esfInvoice() async {
    emit(const EsfInvoiceState.loading());
    try {
      final result = await useCase.esfInvoice('20705198701479');
      final statuses = await useCase.esfStatus('20705198701479');
      emit(
        EsfInvoiceState.success(result, statuses),
      );
    } catch (e) {
      emit(
        EsfInvoiceState.error(e.toString()),
      );
    }
  }

  Future<void> esfInvoiceSorted({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    emit(const EsfInvoiceState.loading());
    try {
      final result = await useCase.esfInvoice(
        '20705198701479',
        createdDateFrom: createdDateFrom,
        createdDateTo: createdDateTo,
        exchangeCode: exchangeCode,
        statusCode: statusCode,
        invoiceNumber: invoiceNumber,
        contractorTin: contractorTin,
      );
      final statuses = await useCase.esfStatus('20705198701479');
      emit(
        EsfInvoiceState.success(result, statuses),
      );
    } catch (e) {
      emit(
        EsfInvoiceState.error(e.toString()),
      );
    }
  }

  Future<void> esfIncome() async {
    emit(const EsfInvoiceState.loading());
    try {
      final result = await useCase.esfInvoice(
        '20705198701479',
      );
      final statuses = await useCase.esfStatus('20705198701479');
      emit(
        EsfInvoiceState.success(result, statuses),
      );
    } catch (e) {
      emit(
        EsfInvoiceState.error(e.toString()),
      );
    }
  }

  Future<void> esfIncomeSorted({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    emit(const EsfInvoiceState.loading());
    try {
      final result = await useCase.esfInvoice(
        '20705198701479',
        exchangeCode: exchangeCode,
        statusCode: statusCode,
        invoiceNumber: invoiceNumber,
        contractorTin: contractorTin,
      );
      final statuses = await useCase.esfStatus('20705198701479');
      emit(
        EsfInvoiceState.success(result, statuses),
      );
    } catch (e) {
      emit(
        EsfInvoiceState.error(e.toString()),
      );
    }
  }

  Future<void> esfAcceptOrReject(
      int statusCode, List<String> documentUuids) async {
    emit(const EsfInvoiceState.loading());
    try {
      await useCase.esfAcceptOrReject(
        '20705198701479',
        documentUuids,
        statusCode,
      );
    } catch (e) {
      emit(
        EsfInvoiceState.error(e.toString()),
      );
    }
  }
}
