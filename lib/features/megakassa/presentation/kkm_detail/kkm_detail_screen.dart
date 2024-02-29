import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_detail/cubit/get_kkm_detail_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class MegaKassaKkmDetailScreen extends StatelessWidget {
  const MegaKassaKkmDetailScreen({
    super.key,
    required this.cashbox,
  });

  final MegaKassaKkmEntity cashbox;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MegaKassaGetKkmDetailCubit>()
        ..getCashboxDetail(cashboxId: cashbox.rnm),
      child: Scaffold(
        backgroundColor: const Color(0xffF3F4F5),
        appBar: CustomAppBar(
          title: cashbox.name,
          titleTextStyle: AppTextStyles.s16W700(
            color: AppColors.color2C2C2CBlack,
          ),
          backgroundColor: const Color(0xffF3F4F5),
          centerTitle: false,
        ),
        body:
            BlocBuilder<MegaKassaGetKkmDetailCubit, MegaKassaGetKkmDetailState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const AppIndicator(),
              success: (detail) => ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                children: [
                  _buildInfoRow(
                    title: 'Инн:',
                    info: detail.tin,
                  ),
                  _buildInfoRow(
                    title: 'Рнм:',
                    info: detail.rnm,
                  ),
                  _buildInfoRow(
                    title: 'Дата снятия с учета ККМ:',
                    info: detail.endDate != null
                        ? DateFormat('dd.MM.yyyy HH:mm').format(detail.endDate!)
                        : '--.--.---- --:--',
                  ),
                  _buildInfoRow(
                    title: 'Статус ККМ',
                    info: getStatusName(detail.status ?? ''),
                  ),
                  _buildInfoRow(
                    title: 'Фискальн. модуль:',
                    info: detail.fm,
                  ),
                  _buildInfoRow(
                    title: 'Тип НП:',
                    info: (detail.vatPayer ?? false)
                        ? 'Плательщик ндс'
                        : 'Неплательщик ндс',
                  ),
                  _buildInfoRow(
                    title: 'Вид деятельн. (18):',
                    info: detail.businessActivity?.name,
                  ),
                  _buildInfoRow(
                    title: 'Код и наим. налог. органа:',
                    info: detail.taxAuthDep?.name,
                  ),
                  _buildInfoRow(
                    title: 'Налоговый режим:',
                    info: (detail.taxSystems?.isNotEmpty ?? false)
                        ? detail.taxSystems?.first.taxName
                        : '-',
                  ),
                  _buildInfoRow(
                    title: 'Тип объекта предприн. (34):',
                    info: detail.entrepreneurship?.name,
                  ),
                  _buildInfoRow(
                    title: 'Наименование торг. точки:',
                    info: detail.shopName,
                  ),
                  _buildInfoRow(
                    title: 'Дополн. парам. расчетов:',
                    info: detail.calcItems
                            ?.map((e) => e.attributeName ?? '-')
                            .toString()
                            .substring(1)
                            .substring(
                                0,
                                (detail.calcItems
                                            ?.map((e) => e.attributeName ?? '-')
                                            .toString()
                                            .length ??
                                        1) -
                                    2) ??
                        '-',
                  ),
                  _buildInfoRow(
                    title: 'Место расчетов:',
                    info: detail.sellPlace?.name,
                  ),
                  _buildInfoRow(
                    title: 'Адрес объекта:',
                    info: detail.city,
                  ),
                  _buildInfoRow(
                    title: 'Широта, долгота:',
                    info: '${detail.lat ?? '-'}, ${detail.lon ?? '-'}',
                  ),
                  _buildInfoRow(
                    title: 'Модель (версия ПККМ):',
                    info: detail.cashBoxVersion?.definition,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String getStatusName(String status) {
    switch (status.toUpperCase()) {
      case 'ACTIVE':
        return 'Активна';
      case 'BLOCKED':
        return 'Заблокирована';
      case 'SUSPEND':
        return 'В ожидании оплаты';
      case 'DEREGISTERED':
        return 'Снят с регистрации';
      case 'DELETED':
        return 'Удален';
      default:
        return 'В паузе';
    }
  }

  Widget _buildInfoRow({
    required String title,
    required String? info,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: AppTextStyles.s16W500(
                color: AppColors.color6B7583Grey,
              ),
            ),
          ),
          Flexible(
            child: Text(
              info ?? '-',
              textAlign: TextAlign.right,
              style: AppTextStyles.s16W500(
                color: AppColors.color2C2C2CBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
