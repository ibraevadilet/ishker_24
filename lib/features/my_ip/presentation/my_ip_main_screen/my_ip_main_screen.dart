import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/get_my_ip_cubit/get_my_ip_cubit.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/widgets/copy_container_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_button.dart';

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
                  declinedIp: (message) => DeclinedIPWidget(reason: message),
                  inProccess: () => const IpInProccessWidget(),
                  error: (error) => AppErrorText(error: error),
                  success: (model) => Column(
                    children: [
                      const SizedBox(height: 26),
                      CustomButton(
                        color: Colors.white,
                        onPress: () {
                          AppRouting.pushFunction(
                            MyCertficateRoute(certUrl: model.image!),
                          );
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
                      const SizedBox(height: 12),
                      const CopyContainerWidget(
                        title: 'ФИО',
                        subTitle: 'Нуждин Сергей Иванович',
                      ),
                      const CopyContainerWidget(
                        title: 'ИНН',
                        subTitle: '209091993011234',
                      ),
                      const CopyContainerWidget(
                        title: 'ОКПО',
                        subTitle: '28294729',
                      ),
                      const CopyContainerWidget(
                        title: 'Регистрационный номер',
                        subTitle: '003-2023-234-1294',
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
