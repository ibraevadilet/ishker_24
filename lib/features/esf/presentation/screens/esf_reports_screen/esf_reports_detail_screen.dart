import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_accept_cubit/esf_accept_cubit.dart';
import 'package:ishker_24/features/esf/presentation/screens/esf_reports_screen/widgets/detail_column_container.dart';
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
                          DetailColumnContainer(
                            title: 'Номер ЭСФ',
                            value: widget.invoice.invoiceNumber,
                          ),
                          DetailColumnContainer(
                            title: 'Статус',
                            value: widget.invoice.status.name,
                            color: widget.invoice.status.name == 'Удален'
                                ? Colors.red
                                : AppColors.color32D681Green,
                          ),
                          DetailColumnContainer(
                            title: 'Получатель',
                            value:
                                '${widget.invoice.contractor.pin} - ${widget.invoice.contractor.fullName}',
                          ),
                          DetailColumnContainer(
                            title: 'Вид операции',
                            value: widget.invoice.receiptType.name,
                          ),
                          DetailColumnContainer(
                            title: 'Вид поставки',
                            value: widget.invoice.deliveryType.name,
                          ),
                          DetailColumnContainer(
                            title: 'Дата заключения договора на поставку',
                            value: widget.invoice.createdDate,
                          ),
                          DetailColumnContainer(
                            title: 'Дата оформления',
                            value: widget.invoice.invoiceDate,
                          ),
                          DetailColumnContainer(
                            title: 'Дата поставки',
                            value: widget.invoice.deliveryDate,
                          ),
                          DetailColumnContainer(
                            title: 'ИНН и наименование продавца',
                            value:
                                '${widget.invoice.legalPerson.pin}-${widget.invoice.legalPerson.fullName}',
                          ),
                          DetailColumnContainer(
                            title: 'Банковский счет поставщика',
                            value: widget.invoice.legalPersonBankAccount,
                          ),
                          DetailColumnContainer(
                            title: 'Банковский сче покупателя',
                            value: widget.invoice.contractorBankAccount,
                          ),
                          DetailColumnContainer(
                            title: 'Валюта',
                            value:
                                '${widget.invoice.currency.code} - ${widget.invoice.currency.name}',
                          ),
                          DetailColumnContainer(
                            title: 'Номер договора на поставку',
                            value: widget.invoice.number,
                          ),
                          DetailColumnContainer(
                            title: 'Комментарии',
                            value: widget.invoice.note,
                          ),
                          DetailColumnContainer(
                            title: 'Коды поставок',
                            value:
                                '${widget.invoice.deliveryType.code}-${widget.invoice.deliveryType.name}',
                          ),
                          DetailColumnContainer(
                            title: 'Форма оплаты',
                            value: widget.invoice.paymentType.name,
                          ),
                          DetailColumnContainer(
                            title: 'НДС',
                            value: widget.invoice.vatTaxType.name,
                          ),
                          DetailColumnContainer(
                            title: 'documentUuid',
                            value: widget.invoice.documentUuid,
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
