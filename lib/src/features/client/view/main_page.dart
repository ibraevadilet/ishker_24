import 'dart:developer' as dev;

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/features/home/bank_page.dart';
import 'package:ishker_24/src/features/home/home_page.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int index = 0;

  List<Widget> pages = const [
    HomePage(),
    BankPage(),
    BlankPage(),
    BlankPage(),
    BlankPage(),
    // const HomeMainScreen(),
    // const BankMainScreen(),
    // const QrMainScreen(),
    // const MyIpMainScreen(),
    // const SettingsMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Нажмите еще раз, чтобы выйти'),
          duration: Duration(seconds: 1),
        ),
        child: SafeArea(child: pages[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedFontSize: 14,
        unselectedItemColor: AppColors.color6B7583Grey,
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        currentIndex: index,
        onTap: (i) {
          // context.read<BottomNavigatorCubit>().getCurrentPage(index);

          setState(() => index = i);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.color54B25AMain,
            icon: SvgPicture.asset(AppImages.homeIcon),
            activeIcon: SvgPicture.asset(
              AppImages.homeIcon,
              colorFilter: const ColorFilter.mode(
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
              colorFilter: const ColorFilter.mode(
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
              colorFilter: const ColorFilter.mode(
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
              colorFilter: const ColorFilter.mode(
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
              colorFilter: const ColorFilter.mode(
                AppColors.color54B25AMain,
                BlendMode.srcIn,
              ),
            ),
            label: 'Ещё',
          ),
        ],
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('blank'),
          titleTextStyle: AppTextStyles.s20W700(),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          centerTitle: false,
          iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
          pinned: true,
        ),
        const SliverFillRemaining(child: Center(child: Text('blank'))),
      ],
    );
  }
}
