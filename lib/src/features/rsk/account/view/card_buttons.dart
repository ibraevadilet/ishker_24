import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/src/features/widgets/icon_title_button.dart';
import 'package:ishker_24/src/features/widgets/shimmers.dart';
import 'package:ishker_24/src/features/widgets/styled_toasts.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

import 'cubit/account_info_cubit.dart';

class CardButtons extends StatelessWidget {
  const CardButtons({super.key});

  void showRequisites(BuildContext context) async {
    showSheet(
      context,
      BlocProvider.value(
        value: context.read<AccountInfoCubit>(),
        child: BlocBuilder<AccountInfoCubit, AccountInfoState>(
          builder: (_, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 32,
                      decoration: BoxDecoration(
                        color: AppColors.color617796Grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'requisites'.tr(context: context),
                    style: AppTextStyles.s16W500(),
                  ),
                  const SizedBox(height: 24),
                  _CopyWidget(
                    title: 'accountNumber'.tr(context: context),
                    value: switch (state) {
                      AccountInfoSuccess() => state.account.account,
                      _ => '',
                    },
                  ),
                  _CopyWidget(
                    title: 'recipientBank'.tr(context: context),
                    value: switch (state) {
                      AccountInfoSuccess() => state.account.depname,
                      _ => '',
                    },
                  ),
                  _CopyWidget(
                    title: 'bic'.tr(context: context),
                    value: switch (state) {
                      AccountInfoSuccess() => state.account.bic,
                      _ => '',
                    },
                  ),
                  _CopyWidget(
                    title: 'branch'.tr(context: context),
                    value: switch (state) {
                      AccountInfoSuccess() => state.account.address,
                      _ => '',
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountInfoCubit, AccountInfoState>(
      builder: (context, state) {
        return defaultAnimatedSwitcher(
          switch (state) {
            AccountInfoInitial() || AccountInfoLoading() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTitleButtonShimmer(
                    title: 'pay'.tr(context: context),
                  ),
                  IconTitleButtonShimmer(
                    title: 'refill'.tr(context: context),
                  ),
                  IconTitleButtonShimmer(
                    title: 'toTransfer'.tr(context: context),
                  ),
                  IconTitleButtonShimmer(
                    title: 'requisites'.tr(context: context),
                  ),
                ],
              ),
            _ => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTitleButton(
                    btnKey: const ValueKey('account_card_pay_key'),
                    onTap: () => AppSnackBar.showUnimplementedSnackBar(),
                    imagePath: AppImages.paymentIcon,
                    title: 'pay'.tr(context: context),
                  ),
                  IconTitleButton(
                    btnKey: const ValueKey('account_card_refill_key'),
                    onTap: () {
                      // kDebugMode && state is AccountInfoSuccess
                      //     ? AppRouting.pushFunction(
                      //         RefillRoute(
                      //           qrData: RefillInitialData.fromQr(
                      //               'https://pay.payqr.kg#00020101021132500009qr.rsk.kg010141016129900337000038812021113021233160012%D0%91%D0%90%D0%A2%D0%AB%D0%A0+%D0%A7%D0%AB%D0%9D%D0%93%D0%AB%D0%97520465385303417540105913BATYR+CHYNGYZ6304e035'),
                      //         ),
                      //       )
                      //     : AppSnackBar.showUnimplementedSnackBar();
                    },
                    imagePath: AppImages.replenishIcon,
                    title: 'refill'.tr(context: context),
                  ),
                  IconTitleButton(
                    btnKey: const ValueKey('account_card_transfer_key'),
                    onTap: () {
                      //TODO: позже отрефакторить auth, чтобы все необходимые значения хранились в его состоянии
                      //и все, кому ниже нужны какое-то значения из них, могли подписываться в своих кубитах
                      // final inn =
                      //     sl<SharedPreferences>().getString(SharedKeys.pin);
                      // log('inn: $inn');
                      // if (inn.isNullOrEmpty) return;

                      // kDebugMode && state is AccountInfoSuccess
                      //     ? AppRouting.pushFunction(TransferRoute(
                      //         account: state.account,
                      //         inn: inn!,
                      //       ))
                      //     : AppSnackBar.showUnimplementedSnackBar();
                    },
                    imagePath: AppImages.transferIcon,
                    title: 'toTransfer'.tr(context: context),
                  ),
                  IconTitleButton(
                    onTap: () => showRequisites(context),
                    // onTap: () => log('requisites'),
                    imagePath: AppImages.requisitesIcon,
                    title: 'requisites'.tr(context: context),
                    btnKey: const ValueKey('account_card_requisites_key'),
                  ),
                ],
              ),
          },
        );
      },
    );
  }
}

class _CopyWidget extends StatelessWidget {
  const _CopyWidget({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.s12W400(color: AppColors.color6B7583Grey),
              ),
              Text(
                value,
                style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: value)).then(
              (value) => AppSnackBar.showToastAbaveSheet(
                context,
                '$title ${'copied'.tr(context: context)}',
                isSuccess: true,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: SvgPicture.asset(
            'assets/images/copy_icon.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.color2C2C2CBlack,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
