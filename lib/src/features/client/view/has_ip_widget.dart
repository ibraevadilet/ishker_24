import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/app_device_info.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/client/view/blank_scaffold.dart';
import 'package:ishker_24/src/features/client/view/client_info/client_info_cubit.dart';
import 'package:ishker_24/src/features/client/view/has_ip/has_ip_cubit.dart';
import 'package:ishker_24/src/features/client/view/main_page.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';

class HasIpWidget extends StatefulWidget {
  const HasIpWidget({super.key});

  @override
  State<HasIpWidget> createState() => _HasIpWidgetState();
}

class _HasIpWidgetState extends State<HasIpWidget> {
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
          HasIpSuccess() => const ClientInfoWidget(),
        },
      ),
    );
  }
}

class ClientInfoWidget extends StatelessWidget {
  const ClientInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientInfoCubit, ClientInfoState>(
      listener: (context, state) {},
      builder: (context, state) => switch (state) {
        ClientInfoInitial() ||
        ClientInfoLoading() =>
          const Scaffold(body: AppIndicator()),
        ClientInfoFailure() => BlankScaffold(text: state.e.message),
        ClientInfoSuccess() => state.info.accountsList.isEmpty
            ? BlankScaffold(
                text:
                    'Поздравляем с успешной регистрацией Клиента в нашем банке! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
                btnLabel: 'Открыть счет',
                onPressed: () => dev.log('tap Открыть счет'),
              )
            // EmptyAccountWidget(partyId: state.info.absId)
            : const MainPageView(),
      },
    );
  }
}
