import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/regitser_client_cubit/regitser_client_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class CreateAccountLastScreen extends StatefulWidget {
  const CreateAccountLastScreen({super.key});

  @override
  State<CreateAccountLastScreen> createState() =>
      _CreateAccountLastScreenState();
}

class _CreateAccountLastScreenState extends State<CreateAccountLastScreen> {
  bool benific = false;
  bool doljnosLico = false;
  bool vidDeatelnNelic = false;

  bool get isAllChecked => benific && doljnosLico && vidDeatelnNelic;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegitserClientCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Создание счета',
          centerTitle: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'У меня отсутствует бенифициар',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              Checkbox(
                                activeColor: AppColors.color54B25AMain,
                                value: benific,
                                onChanged: (val) {
                                  setState(() {
                                    benific = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Я не являюсь должностным лицом',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              Checkbox(
                                activeColor: AppColors.color54B25AMain,
                                value: doljnosLico,
                                onChanged: (val) {
                                  setState(() {
                                    doljnosLico = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Мой вид деятельности\nнелицензирован',
                                  style: AppTextStyles.s16W500(),
                                ),
                              ),
                              Checkbox(
                                activeColor: AppColors.color54B25AMain,
                                value: vidDeatelnNelic,
                                onChanged: (val) {
                                  setState(() {
                                    vidDeatelnNelic = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          labelText: 'Кодовое слово',
                          validator: AppInputValidators.emptyValidator,
                          controller:
                              sl<RegisterClientUseCase>().commentController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Ваш счет будет открыт в головном\nфилиале РСК банка по адресу:\nг. Бишкек, ул.Московская, 80/1',
                style: AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 21),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<RegitserClientCubit, RegitserClientState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      onPress: () {
                        if (isAllChecked) {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<RegitserClientCubit>()
                                .registerClient();
                          }
                        } else {
                          AppRouting.pushFunction(const GoBankRoute());
                        }
                      },
                      text: 'Открыть счет',
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
