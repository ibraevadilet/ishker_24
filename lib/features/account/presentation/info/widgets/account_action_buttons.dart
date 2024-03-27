import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/features/account/domain/entities/qr_data.dart';
import 'package:ishker_24/features/account/presentation/transfer/transfer_i2i_screen.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/icon_title_button.dart';
import 'package:ishker_24/widgets/shimmers.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/account_info_cubit.dart';

class AccountActionButtons extends StatelessWidget {
  const AccountActionButtons({super.key, required this.account});

  final String account;

  void showRequisites(BuildContext context) async {
    showSheet(
      context,
      BlocProvider.value(
        value: context.read<AccountInfoCubit>(),
        child: BlocBuilder<AccountInfoCubit, AccountInfoState>(
          builder: (_, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                botttomSheetChertochka,
                Text(
                  'requisites'.tr(context: context),
                  style: AppTextStyles.s16W500(),
                ),
                const SizedBox(height: 24),
                _CopyWidget(
                  title: 'accountNumber'.tr(context: context),
                  value: account,
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
            );
          },
        ),
      ),
    );
  }

  Widget transferChoiceBtn(
    double modalHeight,
    String text,
    VoidCallback onTap,
    String asset,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: AppColors.backgroundColor,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: modalHeight - 28,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppTextStyles.s16W600(
                    color: AppColors.color2C2C2CBlack,
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: asset.isSvg
                      ? SvgPicture.asset(asset)
                      : Image.asset(asset),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTransferChoiceModal(
    BuildContext context, {
    required VoidCallback onTapPhyz,
    required VoidCallback onTapI2I,
  }) async {
    final modalHeight = MediaQuery.sizeOf(context).height * .25;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      // useSafeArea: true,
      builder: (context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: SizedBox(
            height: modalHeight,
            child: Column(
              children: [
                botttomSheetChertochka,
                Row(
                  children: [
                    Expanded(
                      child: transferChoiceBtn(
                        modalHeight,
                        'На карту физ. лица',
                        onTapPhyz,
                        AppImages.cardIcon,
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * .16,
                      width: 1,
                      decoration: const BoxDecoration(
                        color: AppColors.color2C2C2CBlack,
                      ),
                    ),
                    Expanded(
                      child: transferChoiceBtn(
                        modalHeight,
                        'На ишкер',
                        onTapI2I,
                        AppImages.qrCenterIcon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                      AppSnackBar.showUnimplementedSnackBar();
                    },
                    imagePath: AppImages.replenishIcon,
                    title: 'refill'.tr(context: context),
                  ),
                  IconTitleButton(
                    btnKey: const ValueKey('account_card_transfer_key'),
                    onTap: () {
                      kDebugMode && state is AccountInfoSuccess
                          ? showTransferChoiceModal(
                              context,
                              onTapPhyz: () async {
                                //TODO: позже отрефакторить auth, чтобы все необходимые значения хранились в его состоянии
                                //и все, кому ниже нужны какое-то значения из них, могли подписываться в своих кубитах
                                final inn = sl<SharedPreferences>()
                                    .getString(SharedKeys.pin);
                                log('inn: $inn');
                                if (inn.isNullOrEmpty) {
                                  AppSnackBar.showSnackBar(
                                    'Извините, ошибка кэша ИНН',
                                  );

                                  return;
                                }

                                Navigator.of(context).pop();
                                AppRouting.pushFunction(TransferRoute(
                                  account: state.account,
                                  inn: inn!,
                                  accountInfoCubit:
                                      context.read<AccountInfoCubit>(),
                                ));
                              },
                              onTapI2I: () async {
                                Navigator.of(context).pop();
                                AppRouting.pushFunction(TransferI2IRoute(
                                  account: state.account,
                                  accountInfoCubit:
                                      context.read<AccountInfoCubit>(),
                                ));
                              },
                            )
                          : AppSnackBar.showUnimplementedSnackBar();
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
                duration: const Duration(seconds: 1),
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
