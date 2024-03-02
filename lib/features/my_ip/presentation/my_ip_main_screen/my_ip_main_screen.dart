import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/get_my_ip_cubit/get_my_ip_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class MyIpMainScreen extends StatelessWidget {
  const MyIpMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetMyIpCubit>(),
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<GetMyIpCubit, GetMyIpState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const AppIndicator(),
                  emptyIp: () => const EmptyIpWidget(),
                  declinedIp: (message, date) =>
                      DeclinedIPWidget(reason: message, date: date),
                  inProccess: () => const IpInProccessWidget(),
                  error: (error) => AppErrorText(error: error),
                  success: (model) => Column(
                    children: [
                      const SizedBox(height: 26),
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          shape: const CircleBorder(),
                          onTap: () async {
                            AppRouting.pushFunction(
                              MyCertficateRoute(
                                model: model,
                              ),
                            );
                          },
                          leading: SvgPicture.asset(
                            AppImages.ipIcon,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Свидетельство ИП',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              SvgPicture.asset(
                                AppImages.arrowForwardIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          shape: const CircleBorder(),
                          onTap: () {
                            AppRouting.pushFunction(const NalogMainRoute());
                          },
                          leading: SvgPicture.asset(
                            AppImages.taxIcon,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Единый налог',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              SvgPicture.asset(
                                AppImages.arrowForwardIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          shape: const CircleBorder(),
                          onTap: () {
                            AppRouting.pushFunction(const EsfRoute());
                          },
                          leading: SvgPicture.asset(
                            AppImages.esfIcon,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Электронная счет-фактура',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              SvgPicture.asset(
                                AppImages.arrowForwardIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          shape: const CircleBorder(),
                          onTap: () {
                            AppRouting.pushFunction(
                              const MegaKassaEntryRoute(),
                            );
                          },
                          leading: SvgPicture.asset(
                            AppImages.kkmIcon,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'ККМ',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              SvgPicture.asset(
                                AppImages.arrowForwardIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
