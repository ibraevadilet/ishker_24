import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class MegaKassaKkmPersonalAccountScreen extends StatelessWidget {
  const MegaKassaKkmPersonalAccountScreen({super.key});

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
                color: Colors.white,
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
