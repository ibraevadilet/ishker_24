import 'dart:developer' as dev;

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/app_device_info.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/client/view/blank_scaffold.dart';
import 'package:ishker_24/src/features/client/view/client_info/client_info_cubit.dart';
import 'package:ishker_24/src/features/client/view/has_ip/has_ip_cubit.dart';
import 'package:ishker_24/src/features/home/bank_page.dart';
import 'package:ishker_24/src/features/home/home_page.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ClientInfoCubit _clientInfoCubit;
  late HasIpCubit _hasIpCubit;

  @override
  void initState() {
    super.initState();

    _hasIpCubit = HasIpCubit(
      pin: context.read<AuthCubit>().state.pin,
      hasIpUseCase: sl(),
      hasBankUseCase: sl(),
    );

    _clientInfoCubit = ClientInfoCubit(
      infoUseCase: sl(),
      pin: context.read<AuthCubit>().state.pin,
    );
  }

  @override
  void dispose() {
    _hasIpCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _clientInfoCubit..init()),
        BlocProvider(
          create: (_) => _hasIpCubit..init(sl<AppDeviceInfo>().id),
        ),
      ],
      child: BlocConsumer<HasIpCubit, HasIpState>(
        listener: (context, state) {},
        builder: (context, state) => switch (state) {
          HasIpInitial() ||
          HasIpLoading() =>
            const Scaffold(body: AppIndicator()),
          HasIpEmpty() => BlankScaffold(
              text:
                  'Чтобы начать полноценно пользоваться всеми возможностями нашего сервиса, мы предлагаем вам зарегистрироваться как индивидуального предпринимателя (ИП). Регистрация проста и займет всего несколько минут.',
              assetPath: AppImages.empyListIconSvg,
              btnLabel: 'Регистрация ИП',
              onPressed: () => dev.log('tap reg ip'),
            ),
          HasIpInProgress() => const BlankScaffold(
              text: 'Ваша заявка на получение ИП в обработке',
              assetPath: AppImages.empyListIconSvg,
            ),
          HasIpRefused() => BlankScaffold(
              text: state.reason,
              assetPath: AppImages.empyListIconSvg,
              btnLabel: 'Регистрация ИП',
              onPressed: () => dev.log('tap reg ip'),
            ),
          HasIpEmptyBank() => BlankScaffold(
              text:
                  'Поздравляем с успешной регистрацией ИП в нашем приложении! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
              assetPath: AppImages.empyListIconSvg,
              btnLabel: 'Открыть счет',
              onPressed: () => dev.log('tap create acc'),
            ),
          HasIpFailure() => BlankScaffold(
              text: state.e.message,
              assetPath: AppImages.empyListIconSvg,
            ),
          HasIpSuccess() => const MainPageView(),
        },
      ),
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
