import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_registration/gns_registration_screen.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_personal_account/kkm_personal_account_screen.dart';
import 'package:ishker_24/features/megakassa/presentation/megakassa_entry/cubit/get_megakassa_status_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

@RoutePage()
class MegaKassaEntryScreen extends StatelessWidget {
  const MegaKassaEntryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocProvider.value(
        value: sl<MegaKassaGetMegaKassaStatusCubit>(),
        child: BlocBuilder<MegaKassaGetMegaKassaStatusCubit,
            GetMegaKassaStatusState>(
          builder: (context, state) {
            return state.when(
              error: (text) => Scaffold(
                appBar: AppBar(),
                body: AppErrorText(error: text),
              ),
              loading: () => const Scaffold(body: AppIndicator()),
              registered: () => const MegaKassaKkmPersonalAccountScreen(),
              unregistered: () => const MegaKassaGnsRegistrationScreen(),
            );
          },
        ),
      ),
    );
  }
}
