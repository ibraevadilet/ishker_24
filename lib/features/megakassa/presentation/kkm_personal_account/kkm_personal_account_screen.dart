import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/ishker_dialogs.dart';
import 'package:ishker_24/widgets/spaces.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MegaKassaKkmPersonalAccountScreen extends StatefulWidget {
  const MegaKassaKkmPersonalAccountScreen({
    super.key,
    required this.isAfterRegistration,
  });

  final bool isAfterRegistration;

  @override
  State<MegaKassaKkmPersonalAccountScreen> createState() =>
      _MegaKassaKkmPersonalAccountScreenState();
}

class _MegaKassaKkmPersonalAccountScreenState
    extends State<MegaKassaKkmPersonalAccountScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isAfterRegistration) {
        IshkerDialog.showDraggableBottomSheet(
          initialChildSize: 0.8,
          maxChildSize: 0.8,
          context: context,
          child: const _InstalBottomSheet(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4F5),
      appBar: CustomAppBar(
        title: 'Личный кабинет ККМ',
        titleTextStyle: AppTextStyles.s16W700(
          color: AppColors.color2C2C2CBlack,
        ),
        backgroundColor: const Color(0xffF3F4F5),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          _MenuItem(
            title: 'Мой профиль',
            iconPath: AppImages.user,
            bgColor: const Color(0xff3867D6),
            onPressed: () {
              context.router.push(const MegaKassaMyProfileRoute());
            },
          ),
          const SizedBox(height: 8),
          _MenuItem(
            title: 'Список касс',
            iconPath: AppImages.cashRegister,
            bgColor: const Color(0xff32BD72),
            onPressed: () {
              context.router.push(const MegaKassaKkmListRoute());
            },
          ),
          const SizedBox(height: 8),
          _MenuItem(
            title: 'MegaKassa',
            iconPath: AppImages.mkLogoSvg,
            bgColor: const Color(0xffA0E73F),
            onPressed: () {
              IshkerDialog.showDraggableBottomSheet(
                initialChildSize: 0.8,
                maxChildSize: 0.8,
                context: context,
                child: const _InstalBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _InstalBottomSheet extends StatelessWidget {
  const _InstalBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.75,
      child: Column(
        children: [
          Image.asset(AppImages.installMk),
          const SizedBox(height: 30),
          Text(
            'Скачай приложение\nMegaKassa',
            style: AppTextStyles.s20W700(
              color: AppColors.color2C2C2CBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Для использования функций кассы, пожалуйста, установите приложение MegaKassa',
              style: AppTextStyles.s16W400(
                color: AppColors.color2C2C2CBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          CustomButton(
            height: 62,
            radius: 16,
            onPress: () async {
              if (Platform.isIOS) {
                await launchUrlString(
                    "https://apps.apple.com/us/app/megakassa/id1635280667");
              } else {
                await launchUrlString(
                    "https://play.google.com/store/apps/details?id=kg.megacom.ofd");
              }
            },
            aroundButtonPadding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.color2C2C2CBlack,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Platform.isIOS
                      ? AppImages.appStoreLogo
                      : AppImages.playStoreLogo,
                  scale: 4,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Доступно в',
                      style: AppTextStyles.s13W400(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Platform.isIOS ? 'App Store' : 'Google Play',
                      style: AppTextStyles.s16W700(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.onPressed,
    required this.title,
    required this.iconPath,
    required this.bgColor,
  });

  final String title;
  final String iconPath;
  final Color bgColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                iconPath,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                color: title == 'MegaKassa' ? null : Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.s16W500(
                  color: AppColors.color2C2C2CBlack,
                ),
              ),
            ),
            SvgPicture.asset(AppImages.arrowForwardIcon)
          ],
        ),
      ),
    );
  }
}
