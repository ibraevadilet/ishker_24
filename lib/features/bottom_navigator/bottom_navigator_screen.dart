import 'package:auto_route/auto_route.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/bank/presentation/bank_main_screen/bank_main_screen.dart';
import 'package:ishker_24/features/bottom_navigator/logic/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/home_main_screen.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/my_ip_main_screen.dart';
import 'package:ishker_24/features/qr/presentation/qr_main_screen/qr_main_screen.dart';
import 'package:ishker_24/features/settings/presentation/settings_main_screen/settings_main_screen.dart';
import 'package:ishker_24/theme/app_colors.dart';

@RoutePage()
class BottomNavigatorScreen extends StatelessWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
      builder: (context, state) {
        return Scaffold(
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text('Нажмите еще раз, чтобы выйти'),
              duration: Duration(seconds: 1),
            ),
            child: pages[state.index],
          ),
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedFontSize: 14,
            unselectedItemColor: AppColors.color6B7583Grey,
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            currentIndex: state.index,
            onTap: (index) {
              context.read<BottomNavigatorCubit>().getCurrentPage(index);
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.color54B25AMain,
                icon: SvgPicture.asset(AppImages.homeIcon),
                activeIcon: SvgPicture.asset(
                  AppImages.homeIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.color54B25AMain,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.bankIcon),
                activeIcon: SvgPicture.asset(
                  AppImages.bankIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.color54B25AMain,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Банк',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.qrIcon),
                activeIcon: SvgPicture.asset(
                  AppImages.qrIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.color54B25AMain,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'QR',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.myIpIcon),
                activeIcon: SvgPicture.asset(
                  AppImages.myIpIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.color54B25AMain,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Мой ИП',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.moreIcon),
                activeIcon: SvgPicture.asset(
                  AppImages.moreIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.color54B25AMain,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Ещё',
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Widget> pages = [
  const HomeMainScreen(),
  const BankMainScreen(),
  const QrMainScreen(),
  const MyIpMainScreen(),
  const SettingsMainScreen(),
];
