import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/bank/presentation/bank_main_screen/check_bank_cubit/check_bank_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/bank_zaglushka_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

class BankMainScreen extends StatelessWidget {
  const BankMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CheckBankCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Мой банк',
          centerTitle: false,
        ),
        body: Padding(
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
                // emptyBank: () => Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Spacer(),
                //     SvgPicture.asset(AppImages.empyListIconSvg),
                //     const Spacer(),
                //     Text(
                //       'Поздравляем с успешной регистрацией ИП в нашем приложении! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
                //       style: AppTextStyles.s16W500(),
                //       textAlign: TextAlign.center,
                //     ),
                //     const Spacer(),
                //     CustomButton(
                //       onPress: () =>
                //           AppRouting.pushFunction(const CreateAccountRoute()),
                //       text: 'Открыть счет',
                //     ),
                //     const Spacer(),
                //   ],
                // ),
                // success: () => const BankInfoWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}
