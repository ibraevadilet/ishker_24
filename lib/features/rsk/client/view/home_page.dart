import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_account_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/features/rsk/client/view/check_client_widget.dart';
import 'package:ishker_24/features/rsk/client/view/has_ip/has_ip_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_button.dart';

import 'client_info/client_info_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageView2();
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        // shrinkWrap: true,
        slivers: [
          // SliverAppBar(
          //   title: Text('myBank'.tr(context: context)),
          //   titleTextStyle: AppTextStyles.s20W700(),
          //   elevation: 0,
          //   backgroundColor: AppColors.backgroundColor,
          //   centerTitle: false,
          //   iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
          //   pinned: true,
          // ),
          BlocBuilder<HasIpCubit, HasIpState>(
            builder: (_, state) {
              switch (state) {
                case HasIpInitial() || HasIpLoading():
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: AppIndicator(),
                  );

                case HasIpEmpty():
                  // return EmptyIpWidget();
                  return BlankWidget(
                    text:
                        'Чтобы начать полноценно пользоваться всеми возможностями нашего сервиса, мы предлагаем вам зарегистрироваться как индивидуального предпринимателя (ИП). Регистрация проста и займет всего несколько минут.',
                    assetPath: AppImages.empyListIconSvg,
                    btnLabel: 'Регистрация ИП',
                    onPressed: () =>
                        AppRouting.pushFunction(const RegisterIPMainRoute()),
                  );
                case HasIpInProgress():
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: IpInProccessWidget(),
                  );
                case HasIpRefused():
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: DeclinedIPWidget(
                      reason: state.reason,
                      date: state.created ?? DateTime.now(),
                    ),
                  );

                case HasIpEmptyBank():
                  return BlankWidget(
                    text:
                        'Поздравляем с успешной регистрацией ИП в нашем приложении! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
                    assetPath: AppImages.empyListIconSvg,
                    btnLabel: 'Открыть счет',
                    onPressed: () =>
                        AppRouting.pushFunction(const CreateAccountRoute()),
                  );

                case HasIpSuccess():
                  return const FullHasWidget();

                case HasIpFailure():
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: AppErrorText(error: state.e.message),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

class BlankWidget extends StatelessWidget {
  const BlankWidget({
    super.key,
    required this.text,
    required this.assetPath,
    required this.onPressed,
    required this.btnLabel,
  });

  final String text;
  final String assetPath;
  final VoidCallback onPressed;
  final String btnLabel;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            assetPath.isSvg
                ? SvgPicture.asset(assetPath)
                : Image.asset(assetPath),
            const Spacer(),
            Text(
              text,
              style: AppTextStyles.s16W500(),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              onPress: onPressed,
              text: btnLabel,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class FullHasWidget extends StatelessWidget {
  const FullHasWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientInfoCubit, ClientInfoState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ClientInfoCubit>().init();
            // await Future.delayed(const Duration(milliseconds: 1500));
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: switch (state) {
                  ClientInfoInitial() ||
                  ClientInfoLoading() =>
                    const AppIndicator(),
                  ClientInfoFailure() => AppErrorText(error: state.e.message),
                  ClientInfoSuccess() => state.info.accountsList.isEmpty
                      ? EmptyAccountWidget(partyId: state.info.absId)
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      state.info.fio,
                                      style: AppTextStyles.s16W600(),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppImages.mainNotificationIcon,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Счета',
                                      style: AppTextStyles.s16W700(),
                                    ),
                                  ),
                                  Visibility(
                                    visible: state.info.accountsList.isEmpty,
                                    child: IconButton(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        AppRouting.pushFunction(
                                          OpenAccountRoute(
                                            partyId: state.info.absId,
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: AppColors.color34C759Green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...state.info.accountsList
                                  .map(
                                    (it) => ListTile(
                                      onTap: () => AppRouting.pushFunction(
                                        AccountInfoRoute(
                                          account: it.accountNumber,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      leading: SvgPicture.asset(
                                        AppCurrencyFormatter.cuccancyIcon(
                                            it.currency),
                                      ),
                                      title: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Счет ...${it.accountNumber.substring(it.accountNumber.length - 3, it.accountNumber.length)}',
                                                style: AppTextStyles.s12W400(
                                                  color:
                                                      AppColors.color6B7583Grey,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              RichText(
                                                text: TextSpan(
                                                  style:
                                                      AppTextStyles.s16W500(),
                                                  children: [
                                                    TextSpan(
                                                      text: '${it.balance} ',
                                                    ),
                                                    TextSpan(
                                                      text: AppCurrencyFormatter
                                                          .cuccancyType(
                                                        it.currency,
                                                      ),
                                                      style: AppTextStyles
                                                              .s16W500()
                                                          .copyWith(
                                                        decoration:
                                                            it.currency == 'KGZ'
                                                                ? TextDecoration
                                                                    .underline
                                                                : null,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomePageView2 extends StatelessWidget {
  const HomePageView2({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckClientWidget(
      successWidget: FullHasWidget(),
    );
  }
}
