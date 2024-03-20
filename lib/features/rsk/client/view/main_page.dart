import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/features/rsk/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/rsk/client/view/bank_page.dart';
import 'package:ishker_24/features/rsk/client/view/client_info/client_info_cubit.dart';
import 'package:ishker_24/features/rsk/client/view/has_ip/has_ip_cubit.dart';
import 'package:ishker_24/features/rsk/client/view/home_page.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.pin});

  final String pin;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ClientInfoCubit(infoUseCase: sl(), pin: pin)..init(),
        ),
        BlocProvider(
          create: (_) => HasIpCubit(
            pin,
            hasIpUseCase: sl(),
            hasBankUseCase: sl(),
          )..init(sl<AppDeviceInfoX>().id),
        ),
        BlocProvider(
          create: (context) => AccountInfoCubit(
            clientInfoCubit: context.read<ClientInfoCubit>(),
            infoUseCase: sl(),
          ),
        ),
        // BlocProvider(
        //   create: (_) => HistoryCubit(
        //     historyUseCase: sl(),
        //     account: account,
        //   )..load(),
        // ),
      ],
      child: const MainPageView(),
    );
  }
}

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int index = 0;

  List<Widget> pages = [
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
          title: Text('blank'),
          titleTextStyle: AppTextStyles.s20W700(),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          centerTitle: false,
          iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
          pinned: true,
        ),
        SliverFillRemaining(child: Center(child: Text('blank'))),
      ],
    );
  }
}
