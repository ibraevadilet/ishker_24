import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/widgets/custom_button.dart';

import 'cubits/refill_cubit/refill_cubit.dart';

@RoutePage()
class RefillScreen extends StatelessWidget {
  const RefillScreen({
    super.key,
    required this.qr,
  });

  final String qr;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RefillCubit(qr),
      child: const RefillView(),
    );
  }
}

class RefillView extends StatefulWidget {
  const RefillView({super.key});

  @override
  State<RefillView> createState() => _RefillViewState();
}

class _RefillViewState extends State<RefillView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RefillCubit, RefillState>(
        builder: (context, state) {
          switch (state) {
            case RefillQrParsed():
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('sum: ${state.sum}'),
                    Text('currency: ${state.currency}'),
                    Text('account: ${state.account}'),
                    Text('name: ${state.name}'),
                  ],
                ),
              );
            default:
              return Center(child: Text('refill'));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomButton(onPress: () => log('on press'), text: 'Перевести'),
        // BlocConsumer<TransferValidateCubit, TransferValidateState>(
        //   listener: (context, state) {
        //     switch (state) {
        //       case TrValidateFailure():
        //         AppSnackBar.showSnackBar(state.e.message);
        //       default:
        //     }
        //   },
        //   builder: (context, vState) => switch (vState) {
        //     TrValidateLoading() => const AppIndicator(),
        //     TrValidateSuccess() => BlocConsumer<TransferCubit, TransferState>(
        //         listener: (context, pState) {
        //           switch (pState) {
        //             case TransferFailure():
        //               AppSnackBar.showSnackBar(pState.e.message);
        //             case TransferSuccess():
        //               showDialog(
        //                 context: context,
        //                 builder: (state) {
        //                   return AlertDialog(
        //                     title: const Text('Перевод в обработке'),
        //                     content: SizedBox(
        //                       width: MediaQuery.sizeOf(context).width - 40,
        //                       child: Column(
        //                         mainAxisSize: MainAxisSize.min,
        //                         // mainAxisAlignment:
        //                         //     MainAxisAlignment.spaceBetween,
        //                         crossAxisAlignment: CrossAxisAlignment.stretch,
        //                         children: [
        //                           detailRow(
        //                             'Сумма',
        //                             (vState.params.summa / 100).toString(),
        //                           ),
        //                           detailRow(
        //                             'Комиссия',
        //                             (vState.params.fee ?? 0).toString(),
        //                           ),
        //                           detailRow(
        //                             'Валюта',
        //                             AppCurrencyFormatter.currencyName(
        //                               vState.params.currency,
        //                             ),
        //                           ),
        //                           detailRow('Куда', vState.params.account),
        //                           detailRow(
        //                             'Откуда',
        //                             vState.params.accountDt.obscureFirstNumbers,
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     actions: <Widget>[
        //                       TextButton(
        //                         onPressed: () => Navigator.of(context).pop(),
        //                         style: TextButton.styleFrom(
        //                           foregroundColor: AppColors.color54B25AMain,
        //                         ),
        //                         child: const Text('Ок'),
        //                       ),
        //                     ],
        //                   );
        //                 },
        //               );
        //             default:
        //           }
        //         },
        //         builder: (context, state) => switch (state) {
        //           TransferLoading() => const AppIndicator(),
        //           _ => CustomButton(
        //               onPress: () =>
        //                   context.read<TransferCubit>().perform(vState.params),
        //               text: 'Перевести',
        //             ),
        //         },
        //       ),
        //     _ => CustomButton(
        //         onPress: () {
        //           final isValid = _formKey.currentState?.validate();
        //           if (isValid == false) return;

        //           final card = _cardController.text.trim();
        //           final amount = _sumController.text.trim();

        //           final dv = double.tryParse(amount) ?? 0.0;

        //           setState(() => _sumController.text = dv.toString());

        //           context
        //               .read<TransferValidateCubit>()
        //               .validate(card, (dv * 100).toInt());
        //         },
        //         text: 'Далее',
        //       ),
        //   },
        // ),
      ),
    );
  }
}
