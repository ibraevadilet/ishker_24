import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_invoice_cubit/esf_invoice_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class EsfContainer extends StatelessWidget {
  const EsfContainer({
    super.key,
    required this.model,
    required this.type,
  });
  final Invoice model;
  final ESFType type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () async {
        await context.router.push(
          EsfReportsDetailRoute(
            invoice: model,
            type: type,
          ),
        );
        context.read<EsfInvoiceCubit>().esfReports(isFilter: true);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Номер ЭСФ',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    model.invoiceNumber,
                    style: AppTextStyles.s16W500(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Дата создания',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    model.createdDate,
                    style: AppTextStyles.s16W500(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Вид операции',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    model.receiptType.name,
                    style: AppTextStyles.s16W500(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Статус',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    model.status.name,
                    style: AppTextStyles.s16W500(
                      color: model.status.name == 'Удален'
                          ? Colors.red
                          : AppColors.color32D681Green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Контрагент',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    model.contractor.fullName,
                    style: AppTextStyles.s16W500(),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Общая стоимость',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Text(
                  model.totalAmount.toString(),
                  style: AppTextStyles.s16W500(),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
