import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/widgets/select_filial_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class OpenAccountScreen extends StatefulWidget {
  const OpenAccountScreen({super.key, required this.partyId});
  final String partyId;

  @override
  State<OpenAccountScreen> createState() => _OpenAccountScreenState();
}

class _OpenAccountScreenState extends State<OpenAccountScreen> {
  String? selectedBic;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateAccountCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Создание счета',
          centerTitle: false,
          titleTextStyle: AppTextStyles.s16W600(),
          iconColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                SelectFilialWidget(
                  onSelectAdress: (bic) {
                    selectedBic = bic;
                  },
                ),
                const Spacer(),
                BlocBuilder<CreateAccountCubit, CreateAccountState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      onPress: () {
                        if (selectedBic != null) {
                          context
                              .read<CreateAccountCubit>()
                              .createAccount(widget.partyId, selectedBic!);
                        }
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
