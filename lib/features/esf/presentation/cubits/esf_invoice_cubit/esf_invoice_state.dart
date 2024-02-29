part of 'esf_invoice_cubit.dart';

@freezed
class EsfInvoiceState with _$EsfInvoiceState {
  const factory EsfInvoiceState.loading() = _Loading;
  const factory EsfInvoiceState.success(EsfModel data, EsfStatusModel statusList) = _Success;
  const factory EsfInvoiceState.error(String error) = _Error;
}
