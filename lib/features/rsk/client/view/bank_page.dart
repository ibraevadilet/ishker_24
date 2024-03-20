import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/declined_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/ip_in_proccess_widget.dart';
import 'package:ishker_24/features/rsk/client/view/has_ip/has_ip_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BankPageView();
  }
}

class BankPageView extends StatefulWidget {
  const BankPageView({super.key});

  @override
  State<BankPageView> createState() => _BankPageViewState();
}

class _BankPageViewState extends State<BankPageView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // shrinkWrap: true,
      slivers: [
        SliverAppBar(
          title: Text('myBank'.tr(context: context)),
          titleTextStyle: AppTextStyles.s20W700(),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          centerTitle: false,
          iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
          pinned: true,
        ),
      ],
    );
  }
}
