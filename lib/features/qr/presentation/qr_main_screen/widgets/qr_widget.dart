import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_account_widget.dart';
import 'package:ishker_24/features/qr/presentation/qr_main_screen/cubits/generate_qr_cubit/generate_qr_cubit.dart';
import 'package:ishker_24/features/qr/presentation/qr_main_screen/widgets/show_select_account_sheet.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrWidget extends StatefulWidget {
  const QrWidget({super.key});

  @override
  State<QrWidget> createState() => _QrWidgetState();
}

class _QrWidgetState extends State<QrWidget> {
  late AccountChetModel selectedAccount;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GenerateQrCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Мой QR',
                style: AppTextStyles.s16W600(),
              ),
              Text(
                'История',
                style: AppTextStyles.s16W700(
                  color: AppColors.color54B25AMain,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<GenerateQrCubit, GenerateQrState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (link, accounts) {
                  final savedAccount = sl<SharedPreferences>()
                          .getString(SharedKeys.savedAccount) ??
                      '';
                  if (savedAccount.isNotEmpty) {
                    final newAccounts = accounts
                        .where((e) => e.accountNumber == savedAccount)
                        .toList();
                    if (newAccounts.isNotEmpty) {
                      selectedAccount = newAccounts.first;
                    } else {
                      selectedAccount = accounts.first;
                    }
                  } else {
                    selectedAccount = accounts.first;
                  }
                },
              );
            },
            builder: (context, state) {
              return state.when(
                loading: () => const AppIndicator(),
                error: (error) => AppErrorText(error: error),
                emptyAccount: (partyId) => EmptyAccountWidget(partyId: partyId),
                success: (image, accounts) => SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        'Получайте переводы с банковских\nприложений или кошельков',
                        textAlign: TextAlign.center,
                      ),
                      QrImageView(
                        embeddedImage: const AssetImage(AppImages.qrCenterIcon),
                        data: image,
                        size: 200,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Также можно указать сумму к\nзачислению',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        labelText: 'Сумма к зачислению',
                        onChanged: (val) {
                          context.read<GenerateQrCubit>().generateQr(
                                amountFrom: int.tryParse(val) ?? 0,
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Зачислится на счет:',
                            style: AppTextStyles.s14W400(
                                color: AppColors.color6B7583Grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          final result = await showSelectedAccountSheet(
                            context,
                            accounts,
                            selectedAccount,
                          );
                          selectedAccount = result;
                          await sl<SharedPreferences>().setString(
                            SharedKeys.savedAccount,
                            selectedAccount.accountNumber,
                          );
                          context.read<GenerateQrCubit>().generateQr(
                                accountFrom: selectedAccount.accountNumber,
                              );
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppCurrencyFormatter.cuccancyIcon(
                                    selectedAccount.currency),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Счет ...${selectedAccount.accountNumber.substring(selectedAccount.accountNumber.length - 3, selectedAccount.accountNumber.length)}',
                                    style: AppTextStyles.s12W400(
                                      color: AppColors.color6B7583Grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      style: AppTextStyles.s16W500(),
                                      children: [
                                        TextSpan(
                                          text: '${selectedAccount.balance} ',
                                        ),
                                        TextSpan(
                                          text:
                                              AppCurrencyFormatter.cuccancyType(
                                                  selectedAccount.currency),
                                          style:
                                              AppTextStyles.s16W500().copyWith(
                                            decoration:
                                                selectedAccount.currency ==
                                                        'KGZ'
                                                    ? TextDecoration.underline
                                                    : null,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SvgPicture.asset(AppImages.starSelectedIcon),
                              const SizedBox(width: 12),
                              SvgPicture.asset(AppImages.arrowForwardIcon),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        onPress: () async {
                          await Share.shareUri(
                            Uri.parse(image),
                          );
                        },
                        borderColor: AppColors.color54B25AMain,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.shareButtonIcon),
                            const SizedBox(width: 12),
                            Text(
                              'Поделиться',
                              style: AppTextStyles.s16W700(
                                  color: AppColors.color54B25AMain),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
