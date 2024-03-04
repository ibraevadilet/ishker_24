import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_accept_cubit/esf_accept_cubit.dart';
import 'package:ishker_24/features/esf/presentation/widgets/esf_sevice_container.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/esf_expanded_list.dart';

@RoutePage()
class EsfReportsDetailScreen extends StatefulWidget {
  const EsfReportsDetailScreen({
    super.key,
    required this.invoice,
    required this.type,
  });
  final Invoice invoice;
  final ESFType type;

  @override
  State<EsfReportsDetailScreen> createState() => _EsfReportsDetailScreenState();
}

class _EsfReportsDetailScreenState extends State<EsfReportsDetailScreen> {
  ValueNotifier<bool> isPop = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EsfAcceptCubit>(),
      child: ValueListenableBuilder(
        valueListenable: isPop,
        builder: (_, value, child) {
          return PopScope(
            canPop: value,
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
                                  widget.invoice.invoiceNumber,
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
                                  '${widget.invoice.contractor.pin} - ${widget.invoice.contractor.fullName}',
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
                                  widget.invoice.receiptType.name,
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
                                  widget.invoice.deliveryType.name,
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
                                      .format(widget.invoice.deliveryDate),
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
                                      .format(widget.invoice.createdDate),
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
                                      .format(widget.invoice.invoiceDate),
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
                                  '${widget.invoice.legalPerson.pin}-${widget.invoice.legalPerson.fullName}',
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
                                  widget.invoice.legalPersonBankAccount,
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
                                  widget.invoice.contractorBankAccount,
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
                                  '${widget.invoice.currency.code} - ${widget.invoice.currency.name}',
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
                                  widget.invoice.number.toString(),
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
                                      .format(widget.invoice.invoiceDate),
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
                                  widget.invoice.note,
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
                                  '${widget.invoice.deliveryType.code}-${widget.invoice.deliveryType.name}',
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
                                  widget.invoice.paymentType.name,
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
                                  widget.invoice.vatTaxType.name,
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
                              Expanded(
                                child: Text(
                                  'documentUuid',
                                  style: AppTextStyles.s14W500(
                                      color: AppColors.color6B7583Grey),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                        text: widget.invoice.documentUuid,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    widget.invoice.documentUuid,
                                    style: AppTextStyles.s14W500(),
                                  ),
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
                        model: widget.invoice,
                      ),
                      const SizedBox(height: 24),
                      if (widget.invoice.status.code == '30' &&
                          widget.type == ESFType.income)
                        BlocConsumer<EsfAcceptCubit, EsfAcceptState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              loading50: () {
                                isPop.value = false;
                              },
                              loading40: () {
                                isPop.value = false;
                              },
                              success: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                CustomButton(
                                  isLoading: state.isLoading40,
                                  onPress: () {
                                    context
                                        .read<EsfAcceptCubit>()
                                        .esfAcceptOrReject(
                                      40,
                                      [widget.invoice.documentUuid],
                                    );
                                  },
                                  text: 'Принять',
                                ),
                                const SizedBox(height: 16),
                                CustomButton(
                                  loadingColor: AppColors.color54B25AMain,
                                  isLoading: state.isLoading50,
                                  onPress: () {
                                    context
                                        .read<EsfAcceptCubit>()
                                        .esfAcceptOrReject(
                                      50,
                                      [widget.invoice.documentUuid],
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
        },
      ),
    );
  }
}
