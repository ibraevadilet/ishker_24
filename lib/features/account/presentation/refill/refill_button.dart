import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/account/presentation/refill/cubits/refill_cubit/refill_cubit.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class RefillButton extends StatelessWidget {
  const RefillButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RefillCubit, RefillState>(
      listener: (context, state) {
        switch (state) {
          default:
        }
      },
      builder: (context, vState) => switch (vState.status) {
        RequestLoading() => const AppIndicator(),
        // TrValidateSuccess() => BlocConsumer<TransferCubit, TransferState>(
        //     listener: (context, pState) {
        //       switch (pState) {
        //         case TransferFailure():
        //           AppSnackBar.showSnackBar(pState.e.message);
        //         case TransferSuccess():
        //           showDialog(
        //             context: context,
        //             builder: (state) {
        //               return AlertDialog(
        //                 title: const Text('Перевод в обработке'),
        //                 content: SizedBox(
        //                   width: MediaQuery.sizeOf(context).width - 40,
        //                   child: Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     // mainAxisAlignment:
        //                     //     MainAxisAlignment.spaceBetween,
        //                     crossAxisAlignment: CrossAxisAlignment.stretch,
        //                     children: [
        //                       detailRow(
        //                         'Сумма',
        //                         (vState.params.summa / 100).toString(),
        //                       ),
        //                       detailRow(
        //                         'Комиссия',
        //                         (vState.params.fee ?? 0).toString(),
        //                       ),
        //                       detailRow(
        //                         'Валюта',
        //                         AppCurrencyFormatter.currencyName(
        //                           vState.params.currency,
        //                         ),
        //                       ),
        //                       detailRow('Куда', vState.params.account),
        //                       detailRow(
        //                         'Откуда',
        //                         vState.params.accountDt.obscureFirstNumbers,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 actions: <Widget>[
        //                   TextButton(
        //                     onPressed: () => Navigator.of(context).pop(),
        //                     style: TextButton.styleFrom(
        //                       foregroundColor: AppColors.color54B25AMain,
        //                     ),
        //                     child: const Text('Ок'),
        //                   ),
        //                 ],
        //               );
        //             },
        //           );
        //         default:
        //       }
        //     },
        //     builder: (context, state) => switch (state) {
        //       TransferLoading() => const AppIndicator(),
        //       _ => CustomButton(
        //           onPress: () =>
        //               context.read<TransferCubit>().perform(vState.params),
        //           text: 'Перевести',
        //         ),
        //     },
        //   ),
        _ => CustomButton(
            onPress: onPressed,
            text: text,
            radius: 16,
          ),
      },
    );
  }
}
