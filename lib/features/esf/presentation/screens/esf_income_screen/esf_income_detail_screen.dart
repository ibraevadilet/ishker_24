import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_invoice_cubit/esf_invoice_cubit.dart';
import 'package:ishker_24/features/esf/presentation/widgets/esf_sevice_container.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/esf_expanded_list.dart';

@RoutePage()
class EsfIncomeDetailScreen extends StatelessWidget {
  const EsfIncomeDetailScreen({
    super.key,
    required this.invoice,
  });
  final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<EsfInvoiceCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Подробнее',
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EsfExpandedList(
                  title: 'Детали ЭСФ',
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Номер ЭСФ',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.number,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Получатель',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            '${invoice.legalPerson.pin} - ${invoice.legalPerson.fullName}',
                            textAlign: TextAlign.right,
                            style: AppTextStyles.s13W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Вид операции',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.receiptType.name,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Вид поставки',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            invoice.deliveryType.name,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Дата поставки',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            AppDateFormats.formatDdMMYyyy
                                .format(invoice.deliveryDate),
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Дата создания',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            AppDateFormats.formatDdMMYyyy
                                .format(invoice.createdDate),
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Дата оформления',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            AppDateFormats.formatDdMMYyyy
                                .format(invoice.invoiceDate),
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ИНН и\nнаименование\nпродавца',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            '${invoice.contractor.pin}-${invoice.contractor.fullName}',
                            textAlign: TextAlign.right,
                            style: AppTextStyles.s13W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Банковский счет\nпоставщика',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.contractorBankAccount,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Банковский счет\nпокупателя',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.legalPersonBankAccount,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Валюта',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            '${invoice.currency.code} - ${invoice.currency.name}',
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Номер договора\nна поставку',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.invoiceNumber.toString(),
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Дата заключения\nдоговора\nна поставку',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            AppDateFormats.formatDdMMYyyy
                                .format(invoice.invoiceDate),
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Комментарии',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.note,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Коды поставок',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            '${invoice.deliveryType.code}-${invoice.deliveryType.name}',
                            textAlign: TextAlign.right,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Форма оплаты',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.paymentType.name,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'НДС',
                          style: AppTextStyles.s14W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        Flexible(
                          child: Text(
                            invoice.vatTaxType.name,
                            style: AppTextStyles.s14W500(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Услуги', style: AppTextStyles.s16W500()),
                const SizedBox(height: 24),
                EsfSeviceContainer(
                  number: invoice.number,
                  product: 'Flash karra eToker\nPro 7k\nIDO',
                  unit: 'Штука',
                  gked: '',
                  factCount: '1.00000',
                  price: '582,00000',
                  vatAmount: '61,26',
                  nsp: '2%',
                  nspAmount: '10,21',
                  gtdNumber: '',
                  costWitoutTax: '510,53',
                  totalCost: invoice.totalAmount.toString(),
                ),
                const SizedBox(height: 24),
                BlocBuilder<EsfInvoiceCubit, EsfInvoiceState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomButton(
                            onPress: () {
                              context.read<EsfInvoiceCubit>().esfAcceptOrReject(
                                40,
                                [invoice.documentUuid],
                              );
                            },
                            text: 'Принять'),
                        const SizedBox(height: 16),
                        CustomButton(
                          onPress: () {
                            context.read<EsfInvoiceCubit>().esfAcceptOrReject(
                              50,
                              [invoice.documentUuid],
                            );
                          },
                          color: Colors.transparent,
                          borderColor: AppColors.color54B25AMain,
                          text: 'Отклонить',
                          textColor: AppColors.color54B25AMain,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
