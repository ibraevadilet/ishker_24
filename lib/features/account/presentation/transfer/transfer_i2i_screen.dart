import 'dart:io';
import 'dart:developer' as dev;

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/qr_data.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/account/presentation/transfer/cubits/ishker2ishker/transfer_i2i_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/detail_row.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class TransferI2IScreen extends StatelessWidget {
  const TransferI2IScreen({
    super.key,
    required this.account,
    required this.accountInfoCubit,
  });

  final Account account;
  final AccountInfoCubit accountInfoCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: accountInfoCubit),
        BlocProvider(
          create: (_) => TransferI2ICubit(
            account: account,
            validateI2IUseCase: sl(),
            performI2IUseCase: sl(),
          ),
        ),
      ],
      child: const TransferI2IView(),
    );
  }
}

class TransferI2IView extends StatefulWidget {
  const TransferI2IView({super.key});

  @override
  State<TransferI2IView> createState() => _TransferI2IViewState();
}

class _TransferI2IViewState extends State<TransferI2IView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'Оплата по QR',
            centerTitle: false,
          ),
          MyWidget(),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferI2ICubit, TransferI2IState>(
      builder: (context, state) {
        switch (state) {
          case I2IInitial():
            return _ScanQrWidget();
          case I2IScanned():
            return _Form(qrData: state.qrData);
          case I2IFailure():
            return SliverFillRemaining(
                child: Center(child: Text(state.e.message)));
          default:
            return SliverFillRemaining(child: Text('defaault'));
        }
      },
    );
  }
}

class _ScanQrWidget extends StatefulWidget {
  const _ScanQrWidget({super.key});

  @override
  State<_ScanQrWidget> createState() => __ScanQrWidgetState();
}

class __ScanQrWidgetState extends State<_ScanQrWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          ),
          if (kDebugMode)
            OutlinedButton(
              onPressed: () {
                context.read<TransferI2ICubit>().scanned(
                      'https://pay.payqr.kg#00020101021132500009qr.rsk.kg010141016129900337000069112021213021233160012%D0%91%D0%90%D0%A2%D0%AB%D0%A0+%D0%A7%D0%AB%D0%9D%D0%93%D0%AB%D0%97520465385303417540422005913BATYR+CHYNGYZ630499b7',
                    );
              },
              child: Text('qr readed'),
            )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key, required this.qrData});

  final QrData qrData;

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  QrData get qrData => widget.qrData;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  // AccountChetModel? account;

  @override
  void initState() {
    super.initState();

    _controller.text = (qrData.sum / 100).toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              DetailRow(
                title: 'accountNumber'.tr(),
                value: qrData.account.obscureFirstNumbers,
              ),
              DetailRow(title: 'ФИО', value: qrData.name),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _controller,
                labelText: 'Сумма перевода',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [AppInputFormatters.amountFormatter],
                onChanged: (val) => dev.log('val: $val'),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Обязательное поле для заполнения';
                  }

                  return null;
                },
              ),
              // Text(qrData.account),
              // Text(qrData.currency),
              // Text(qrData.link),
              // Text(qrData.name),
              // Text(qrData.sum.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
