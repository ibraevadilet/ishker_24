import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/icon_title_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

import '../history/history_item_widget.dart';

@RoutePage()
class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key, required this.account});

  final String account;

  Widget infoWidget(String title, String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
            ),
            Flexible(
              child: Text(
                value,
                style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AccountInfoCubit(useCase: sl())..load(account),
        ),
        BlocProvider(
          create: (_) => HistoryCubit(
            historyUseCase: sl(),
            account: account,
          )..load(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: AccountInfoView(account: account),
      ),
    );
  }
}

class AccountInfoView extends StatefulWidget {
  const AccountInfoView({super.key, required this.account});

  final String account;

  @override
  State<AccountInfoView> createState() => _AccountInfoViewState();
}

class _AccountInfoViewState extends State<AccountInfoView> {
  String get account => widget.account;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(account),
          titleTextStyle: AppTextStyles.s20W700(),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          centerTitle: false,
          iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<AccountInfoCubit, AccountInfoState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
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
                              state.maybeWhen(
                                orElse: () => const SizedBox.shrink(),
                                success: (model) => RichText(
                                  text: TextSpan(
                                    text:
                                        '${AppCurrencyFormatter.currencyCash(model.amount)} ',
                                    style: AppTextStyles.s28W700(
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        text: 'C',
                                        style: AppTextStyles.s28W700(
                                          color: Colors.white,
                                        ).copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\u00b7\u00b7',
                                  style: AppTextStyles.s14W700(
                                      color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text:
                                          account.substring(account.length - 4),
                                      style: AppTextStyles.s14W400(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTitleButton(
                          onTap: () => AppSnackBar.showUnimplementedSnackBar(),
                          imagePath: AppImages.paymentIcon,
                          title: 'Оплатить',
                        ),
                        IconTitleButton(
                          onTap: () => AppSnackBar.showUnimplementedSnackBar(),
                          imagePath: AppImages.replenishIcon,
                          title: 'Пополнить',
                        ),
                        IconTitleButton(
                          onTap: () => AppSnackBar.showUnimplementedSnackBar(),
                          imagePath: AppImages.transferIcon,
                          title: 'Перевести',
                        ),
                        IconTitleButton(
                          onTap: () => showSheet(
                            context,
                            Column(
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
                                  'Реквизиты',
                                  style: AppTextStyles.s16W500(),
                                ),
                                const SizedBox(height: 24),
                                _CopyWidget(
                                  title: 'Номер счета',
                                  value: account,
                                ),
                                _CopyWidget(
                                  title: 'Банк получатель',
                                  value: state.maybeWhen(
                                    orElse: () => '',
                                    success: (model) => model.depname,
                                  ),
                                ),
                                _CopyWidget(
                                  title: 'БИК',
                                  value: state.maybeWhen(
                                    orElse: () => '',
                                    success: (model) => model.bic,
                                  ),
                                ),
                                _CopyWidget(
                                  title: 'Филиал',
                                  value: state.maybeWhen(
                                    orElse: () => '',
                                    success: (model) => model.address,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          imagePath: AppImages.requisitesIcon,
                          title: 'Реквизиты',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: state.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        success: (model) => ListTile(
                          tileColor: Colors.white,
                          title: Text(
                            'Сумма в обработке',
                            style: AppTextStyles.s14W400(
                              color: AppColors.color6B7583Grey,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              text: '${AppCurrencyFormatter.currencyCash(
                                model.amountUnfree,
                              )} ',
                              style: AppTextStyles.s16W700(
                                color: AppColors.color2C2C2CBlack,
                              ),
                              children: [
                                TextSpan(
                                  text: AppCurrencyFormatter.cuccancyType(
                                    model.currency,
                                  ),
                                  style: AppTextStyles.s16W500(
                                    color: AppColors.color2C2C2CBlack,
                                  ).copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SliverList.list(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Последние операции',
                      style: AppTextStyles.s16W700(),
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () => AppRouting.pushFunction(
                        HistoryRoute(account: account),
                      ),
                      child: Text(
                        'Все',
                        style: AppTextStyles.s16W700(
                          color: AppColors.color54B25AMain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SliverList.builder(
          itemCount: context.watch<HistoryCubit>().state.model.items.length,
          itemBuilder: (context, i) {
            final item = context.watch<HistoryCubit>().state.model.items[i];

            return HistoryItemWidget(item: item);
          },
        ),
      ],
    );
  }
}

class _CopyWidget extends StatelessWidget {
  const _CopyWidget({
    super.key,
    required this.title,
    required this.value,
  });

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
                style: AppTextStyles.s12W400(
                  color: AppColors.color6B7583Grey,
                ),
              ),
              Text(
                value,
                style: AppTextStyles.s16W500(
                  color: AppColors.color2C2C2CBlack,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Clipboard.setData(
              ClipboardData(text: value),
            ).then((value) => AppSnackBar.showToastAbaveSheet(
                  context,
                  '$title скопирован',
                  isSuccess: true,
                  duration: const Duration(
                    seconds: 1,
                  ),
                ));
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
