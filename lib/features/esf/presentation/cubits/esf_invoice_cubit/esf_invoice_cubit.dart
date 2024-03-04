import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/data/models/get_esf_qwery_model.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';
import 'package:ishker_24/features/esf/domain/usecases/esf_invoice_usecase.dart';

part 'esf_invoice_cubit.freezed.dart';
part 'esf_invoice_state.dart';

class EsfInvoiceCubit extends Cubit<EsfInvoiceState> {
  EsfInvoiceCubit({required this.useCase})
      : super(const EsfInvoiceState.loading());

  final EsfInvoiceUseCase useCase;

  int totalElements = 0;
  int currentPage = 0;
  bool isGetAll = false;
  bool isFirstLoad = true;
  late ScrollController scrollController =
      ScrollController(initialScrollOffset: 0)..addListener(_scrollListener);
  final pin = AppSavedPin.getPin();
  DateTime? createdDateFrom;
  DateTime? createdDateTo;
  String? exchangeCode;
  String? statusCode;
  String? invoiceNumber;
  String? contractorTin;
  late ESFType type;

  clear() {
    useCase.invoices.clear();
    isFirstLoad = true;
    currentPage = 0;
    createdDateFrom = null;
    createdDateTo = null;
    exchangeCode = null;
    statusCode = null;
    invoiceNumber = null;
    contractorTin = null;
  }

  Future<void> esfReports({
    bool isFilter = false,
    ESFType? typeFrom,
    DateTime? createdDateFromFrom,
    DateTime? createdDateToFrom,
    String? exchangeCodeFrom,
    String? statusCodeFrom,
    String? invoiceNumberFrom,
    String? contractorTinFrom,
  }) async {
    if (isFilter) {
      useCase.invoices.clear();
      isFirstLoad = true;
      currentPage = 0;
    }
    if (isFirstLoad) {
      emit(const EsfInvoiceState.loading());
    }
    isFirstLoad = false;
    if (typeFrom != null) {
      type = typeFrom;
    }
    if (createdDateFromFrom != null) {
      createdDateFrom = createdDateFromFrom;
    }
    if (createdDateToFrom != null) {
      createdDateTo = createdDateToFrom;
    }
    if (exchangeCodeFrom != null) {
      exchangeCode = exchangeCodeFrom;
    }
    if (statusCodeFrom != null) {
      statusCode = statusCodeFrom;
    }
    if (invoiceNumberFrom != null) {
      invoiceNumber = invoiceNumberFrom;
    }
    if (contractorTinFrom != null) {
      contractorTin = contractorTinFrom;
    }
    try {
      final result = await useCase.esfReports(
        GetEsfQweryModel(
          pin: pin,
          page: currentPage,
          type: type,
          createdDateFrom: createdDateFrom,
          createdDateTo: createdDateTo,
          exchangeCode: exchangeCode,
          statusCode: statusCode,
          invoiceNumber: invoiceNumber,
          contractorTin: contractorTin,
        ),
      );
      totalElements = result.totalElements;
      isGetAll = totalElements == result.invoices.length;
      final statuses = await useCase.esfStatus();
      emit(EsfInvoiceState.success(result, statuses));
    } catch (e) {
      emit(EsfInvoiceState.error(e.toString()));
    }
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (!isGetAll) {
        currentPage = currentPage + 1;
        esfReports();
      }
    }
  }

  @override
  Future<void> close() {
    clear();
    return super.close();
  }
}
