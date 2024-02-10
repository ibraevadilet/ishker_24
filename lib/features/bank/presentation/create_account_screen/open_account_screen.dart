import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class OpenAccountScreen extends StatelessWidget {
  const OpenAccountScreen({super.key, required this.partyId});
  final String partyId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateAccountCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(AppImages.bankImage),
                const SizedBox(height: 24),
                const Text(
                  'Ваш счет будет открыт в головном\nфилиале РСК банка по адресу:\nг. Бишкек, ул.Московская, 80/1',
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                BlocBuilder<CreateAccountCubit, CreateAccountState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      onPress: () {
                        context
                            .read<CreateAccountCubit>()
                            .createAccount(partyId);
                      },
                      text: 'Открыть счет',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
