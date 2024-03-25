import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/extensions.dart';
import 'package:ishker_24/src/features/client/view/has_ip/has_ip_cubit.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';
import 'package:ishker_24/src/features/widgets/custom_button.dart';
import 'package:ishker_24/src/features/widgets/shimmers.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class CheckClientWidget extends StatelessWidget {
  const CheckClientWidget({
    super.key,
    this.shimmer = const AppIndicator(),
    required this.successWidget,
    this.sliverAppBar,
  });

  final Widget shimmer;
  final Widget successWidget;
  final SliverAppBar? sliverAppBar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HasIpCubit, HasIpState>(
      builder: (_, state) => switch (state) {
        HasIpInitial() || HasIpLoading() => shimmerCustomScrollView(shimmer),
        HasIpEmpty() => BlankCustomScrollView(
            text:
                'Чтобы начать полноценно пользоваться всеми возможностями нашего сервиса, мы предлагаем вам зарегистрироваться как индивидуального предпринимателя (ИП). Регистрация проста и займет всего несколько минут.',
            assetPath: AppImages.empyListIconSvg,
            btnLabel: 'Регистрация ИП',
            onPressed: () => log('tap reg ip'),
          ),
        HasIpInProgress() => const BlankCustomScrollView(
            text: 'Ваша заявка на получение ИП в обработке',
            assetPath: AppImages.empyListIconSvg,
          ),
        HasIpRefused() => BlankCustomScrollView(
            text: state.reason,
            assetPath: AppImages.empyListIconSvg,
            btnLabel: 'Регистрация ИП',
            onPressed: () => log('tap reg ip'),
          ),
        HasIpEmptyBank() => BlankCustomScrollView(
            text:
                'Поздравляем с успешной регистрацией ИП в нашем приложении! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
            assetPath: AppImages.empyListIconSvg,
            btnLabel: 'Открыть счет',
            onPressed: () => log('tap create acc'),
          ),
        HasIpFailure() => BlankCustomScrollView(
            text: state.e.message,
            assetPath: AppImages.empyListIconSvg,
          ),
        HasIpSuccess() => successWidget,
      },
    );
  }
}

class BlankCustomScrollView extends StatelessWidget {
  const BlankCustomScrollView({
    super.key,
    required this.text,
    required this.assetPath,
    this.onPressed,
    this.btnLabel,
    this.sliverAppBar,
  });

  final String text;
  final String assetPath;
  final VoidCallback? onPressed;
  final String? btnLabel;
  final SliverAppBar? sliverAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          if (sliverAppBar != null) sliverAppBar!,
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  assetPath.isSvg
                      ? SvgPicture.asset(assetPath)
                      : Image.asset(assetPath),
                  const Spacer(),
                  Text(
                    text,
                    style: AppTextStyles.s16W500(),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  if (onPressed != null && btnLabel != null)
                    CustomButton(onPress: onPressed, text: btnLabel),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
