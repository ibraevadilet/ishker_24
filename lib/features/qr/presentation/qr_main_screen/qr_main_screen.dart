import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/bank/presentation/bank_main_screen/check_bank_cubit/check_bank_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/bank_zaglushka_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';

class QrMainScreen extends StatelessWidget {
  const QrMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: BlocProvider(
        create: (context) => sl<CheckBankCubit>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: BlocBuilder<CheckBankCubit, CheckBankState>(
            builder: (context, state) {
              return state.when(
                emptyIp: () => const EmptyIpWidget(),
                ipInProccess: () => const IpInProccessWidget(),
                declinedIp: (reason, date) =>
                    DeclinedIPWidget(reason: reason, date: date),
                loading: () => const AppIndicator(),
                error: (error) => AppErrorText(error: error),
                emptyBank: () => const BankZaglushkaWidget(),
                success: () => const BankZaglushkaWidget(),
                // emptyBank: () => Scaffold(
                //   appBar: CustomAppBar(
                //     backgroundColor: AppColors.backgroundColor,
                //     titleWidget: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           'Мой QR',
                //           style: AppTextStyles.s16W600(),
                //         ),
                //       ],
                //     ),
                //   ),
                //   body: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Spacer(),
                //       SvgPicture.asset(AppImages.empyListIconSvg),
                //       const Spacer(),
                //       Text(
                //         'Поздравляем с успешной регистрацией ИП в нашем приложении! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
                //         style: AppTextStyles.s16W500(),
                //         textAlign: TextAlign.center,
                //       ),
                //       const Spacer(),
                //       CustomButton(
                //         onPress: () =>
                //             AppRouting.pushFunction(const CreateAccountRoute()),
                //         text: 'Открыть счет',
                //       ),
                //       const Spacer(),
                //     ],
                //   ),
                // ),
                // success: () => const QrWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}
