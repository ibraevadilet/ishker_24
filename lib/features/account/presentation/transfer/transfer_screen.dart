import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/account/presentation/transfer/cubits/transfer_cubit/transfer_cubit.dart';
import 'package:ishker_24/features/account/presentation/transfer/cubits/transfer_validate/transfer_validate_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

import 'package:ishker_24/widgets/styled_toasts.dart';

@RoutePage()
class TransferScreen extends StatelessWidget {
  const TransferScreen({
    super.key,
    required this.account,
    required this.inn,
    required this.accountInfoCubit,
  });

  final Account account;
  final String inn;
  final AccountInfoCubit accountInfoCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: accountInfoCubit),
        BlocProvider(
          create: (_) => TransferValidateCubit(
            validateUseCase: sl(),
            account: account,
            inn: inn,
          ),
        ),
        BlocProvider(create: (_) => TransferCubit(performUseCase: sl())),
      ],
      child: const PayScreenView(),
    );
  }
}

class PayScreenView extends StatefulWidget {
  const PayScreenView({super.key});

  @override
  State<PayScreenView> createState() => _PayScreenViewState();
}

class _PayScreenViewState extends State<PayScreenView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _cardController = TextEditingController();
  final _sumController = TextEditingController();

  @override
  void dispose() {
    _cardController.dispose();
    _sumController.dispose();
    super.dispose();
  }

  Widget detailRow(String title, String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
            ),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      );

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _cardController,
            labelText: 'Номер карты',
            keyboardType: TextInputType.number,
            inputFormatters: [AppInputFormatters.cardFormatter],
            onChanged: (val) => context.read<TransferValidateCubit>().reset(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Введите номер карты';
              }

              final unmasked =
                  AppInputFormatters.cardFormatter.getUnmaskedText();
              if (unmasked.length < 16) {
                return 'Неверный номер карты';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _sumController,
            labelText: 'Сумма перевода',
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            inputFormatters: [AppInputFormatters.amountFormatter],
            onChanged: (val) => context.read<TransferValidateCubit>().reset(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Обязательное поле для заполнения';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<TransferValidateCubit, TransferValidateState>(
            builder: (context, state) {
              return switch (state) {
                TrValidateSuccess() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ФИО',
                        style: AppTextStyles.s16W400(
                          color: AppColors.color6B7583Grey,
                        ),
                      ),
                      Text(
                        state.entity.fio,
                        style: AppTextStyles.s16W600(),
                      ),
                    ],
                  ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }

  Widget successContent() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .2,
        ),
        SvgPicture.asset(AppImages.successCreatedAccountIcon),
        const SizedBox(height: 24),
        Text(
          'Перевод выполнен',
          style: AppTextStyles.s16W400(
            color: AppColors.color2C2C2CBlack,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Детали можно посмотреть в истории',
          style: AppTextStyles.s16W400(
            color: AppColors.color6B7583Grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              title: const Text('Перевести'),
              titleTextStyle: AppTextStyles.s20W700(),
              elevation: 0,
              backgroundColor: AppColors.backgroundColor,
              // centerTitle: false,
              iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
              pinned: true,
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              // SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<TransferCubit, TransferState>(
                  builder: (context, state) => switch (state) {
                    TransferSuccess() => successContent(),
                    _ => buildForm(),
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TransferValidateButton(
            onValidate: () {
              final isValid = _formKey.currentState?.validate();
              if (isValid == false) return;

              final card = AppInputFormatters.cardFormatter.getUnmaskedText();
              final amount = _sumController.text.trim();

              final dv = double.tryParse(amount) ?? 0.0;

              setState(() => _sumController.text = dv.toString());

              context
                  .read<TransferValidateCubit>()
                  .validate(card, (dv * 100).toInt());
            },
          ),
        ),
      ),
    );
  }
}

class TransferValidateButton extends StatelessWidget {
  const TransferValidateButton({super.key, this.onValidate});

  final VoidCallback? onValidate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferValidateCubit, TransferValidateState>(
      listener: (context, state) {
        switch (state) {
          case TrValidateFailure():
            AppSnackBar.showSnackBar(state.e.message);
          default:
        }
      },
      builder: (context, vState) => switch (vState) {
        TrValidateLoading() => const AppIndicator(),
        TrValidateSuccess() => BlocConsumer<TransferCubit, TransferState>(
            listener: (context, pState) {
              switch (pState) {
                case TransferFailure():
                  AppSnackBar.showSnackBar(pState.e.message);
                case TransferSuccess():
                  final account =
                      context.read<TransferValidateCubit>().account.account;
                  context.read<AccountInfoCubit>().load(account);
                default:
              }
            },
            builder: (context, state) => switch (state) {
              TransferLoading() => const AppIndicator(),
              TransferSuccess() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      text: 'История QR переводов',
                      onPress: () => AppRouting.replaceFunction(HistoryRoute(
                        account: context
                            .read<TransferValidateCubit>()
                            .account
                            .account,
                      )),
                      radius: 16,
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      text: 'На главную',
                      onPress: () {
                        final account = context
                            .read<TransferValidateCubit>()
                            .account
                            .account;
                        context.read<AccountInfoCubit>().load(account);
                        Navigator.pop(context);
                      },
                      radius: 16,
                      color: Colors.white,
                      borderColor: AppColors.color1EA31EGreen,
                      textColor: AppColors.color1EA31EGreen,
                    ),
                  ],
                ),
              _ => CustomButton(
                  onPress: () =>
                      context.read<TransferCubit>().perform(vState.params),
                  text: 'Перевести',
                ),
            },
          ),
        _ => CustomButton(onPress: onValidate, text: 'Далее'),
      },
    );
  }
}
