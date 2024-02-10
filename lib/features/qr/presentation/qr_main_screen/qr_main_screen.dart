import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/qr/presentation/qr_main_screen/cubits/generate_qr_cubit/generate_qr_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QrMainScreen extends StatelessWidget {
  const QrMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: BlocProvider(
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
          body: BlocBuilder<GenerateQrCubit, GenerateQrState>(
            builder: (context, state) {
              return state.when(
                loading: () => const AppIndicator(),
                error: (error) => AppErrorText(error: error),
                success: (image) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                int.tryParse(val) ?? 0,
                              );
                        },
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
                      )
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
