import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/get_my_ip_cubit/get_my_ip_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      CustomButton(
                        color: Colors.white,
                        onPress: () async {
                          if (Platform.isIOS) {
                            AppRouting.pushFunction(
                              MyCertficateRoute(
                                certUrl: model.image,
                                model: model,
                              ),
                            );
                          } else {
                            await launchUrl(
                              Uri.parse(
                                model.image!,
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Свидетельство ИП',
                              style: AppTextStyles.s16W500(),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.black,
                            ),
                          ],
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
