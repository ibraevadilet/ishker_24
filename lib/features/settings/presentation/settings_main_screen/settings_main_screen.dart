import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/settings_expanded_list.dart';

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends State<SettingsMainScreen> {
  bool selectedLang = false;
  bool pushEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              SettingsExpandedList(
                image: SvgPicture.asset(
                  AppImages.langIcon,
                ),
                title: 'Смена языка',
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      AppImages.kgLangIcon,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Кыргызский',
                            style: AppTextStyles.s16W500(),
                          ),
                        ),
                        Radio(
                          splashRadius: 14,
                          activeColor: AppColors.color54B25AMain,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.color54B25AMain,
                          ),
                          value: true,
                          groupValue: selectedLang,
                          onChanged: (value) {
                            setState(() {
                              selectedLang = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AppImages.ruLangIcon,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Русский',
                            style: AppTextStyles.s16W500(),
                          ),
                        ),
                        Radio(
                          splashRadius: 14,
                          activeColor: AppColors.color54B25AMain,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.color54B25AMain,
                          ),
                          value: false,
                          groupValue: selectedLang,
                          onChanged: (value) {
                            setState(() {
                              selectedLang = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SettingsExpandedList(
                image: SvgPicture.asset(
                  AppImages.notificationIconSvg,
                ),
                title: 'Уведомления',
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Push-уведомления',
                            style: AppTextStyles.s16W500(),
                          ),
                        ),
                        Switch(
                          thumbColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                          activeColor: AppColors.color54B25AMain,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          value: pushEnable,
                          onChanged: (value) {
                            setState(() {
                              pushEnable = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    AppRouting.pushFunction(const SettingsAboutRoute());
                  },
                  leading: SvgPicture.asset(
                    AppImages.aboutIcon,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'О приложении',
                          style: AppTextStyles.s16W600(),
                        ),
                      ),
                      SvgPicture.asset(
                        AppImages.arrowForwardIcon,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    AppRouting.pushFunction(const SettingsHelpRoute());
                  },
                  leading: SvgPicture.asset(
                    AppImages.helpIcon,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Помощь',
                          style: AppTextStyles.s16W600(),
                        ),
                      ),
                      SvgPicture.asset(
                        AppImages.arrowForwardIcon,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    print('object');
                  },
                  leading: SvgPicture.asset(
                    AppImages.securityIcon,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Безопасность',
                          style: AppTextStyles.s16W600(),
                        ),
                      ),
                      SvgPicture.asset(
                        AppImages.arrowForwardIcon,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    AppImages.exitIcon,
                  ),
                  title: Text(
                    'Выход',
                    style: AppTextStyles.s16W600(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
