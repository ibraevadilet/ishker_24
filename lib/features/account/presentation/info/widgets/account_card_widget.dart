import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/icon_title_button.dart';
import 'package:ishker_24/widgets/shimmers.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/account_info_cubit.dart';

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({super.key, required this.account});

  final String account;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountInfoCubit, AccountInfoState>(
      builder: (context, state) {
        return defaultAnimatedSwitcher(
          switch (state) {
            AccountInfoInitial() || AccountInfoLoading() => shimmer(
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                ),
              ),
            _ => Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.color54B25AMain,
                      AppColors.colorBBD9B9,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFCFCFCF).withOpacity(.25),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        switch (state) {
                          AccountInfoSuccess() => RichText(
                              text: TextSpan(
                                text:
                                    '${AppCurrencyFormatter.currencyCash(state.account.amount)} ',
                                style:
                                    AppTextStyles.s28W700(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: AppCurrencyFormatter.cuccancyType(
                                      state.account.currency,
                                    ),
                                    style: AppTextStyles.s28W700(
                                      color: Colors.white,
                                    ).copyWith(
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                              ),
                            ),
                          _ => const SizedBox.shrink(),
                        },
                        RichText(
                          text: TextSpan(
                            text: '\u00b7\u00b7',
                            style: AppTextStyles.s14W700(color: Colors.white),
                            children: [
                              TextSpan(
                                text: account.substring(account.length - 4),
                                style:
                                    AppTextStyles.s14W400(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          },
        );
      },
    );
  }
}

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
                const SizedBox(height: 12),
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
                    key: const ValueKey('account_card_pay_key'),
                    onTap: () => AppSnackBar.showUnimplementedSnackBar(),
                    imagePath: AppImages.paymentIcon,
                    title: 'pay'.tr(context: context),
                  ),
                  IconTitleButton(
                    key: const ValueKey('account_card_refill_key'),
                    onTap: () => AppSnackBar.showUnimplementedSnackBar(),
                    imagePath: AppImages.replenishIcon,
                    title: 'refill'.tr(context: context),
                  ),
                  IconTitleButton(
                    key: const ValueKey('account_card_transfer_key'),
                    onTap: () async {
                      //TODO: позже отрефакторить auth, чтобы все необходимые значения хранились в его состоянии
                      //и все, кому ниже нужны какое-то значения из них, могли подписываться в своих кубитах
                      final inn =
                          sl<SharedPreferences>().getString(SharedKeys.pin);
                      if (inn.isNullOrEmpty) return;

                      kDebugMode && state is AccountInfoSuccess
                          ? AppRouting.pushFunction(TransferRoute(
                              account: state.account,
                              inn: inn!,
                            ))
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
