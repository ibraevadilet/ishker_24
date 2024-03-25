// import 'dart:io';

import 'dart:convert';
import 'dart:developer' as dev;
// import 'package:auto_route/auto_route.dart';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/formatters/input_formatters.dart';
import 'package:ishker_24/src/core/formatters/validators.dart';
// import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/core/utils/scanner_utils.dart';
import 'package:ishker_24/src/core/widgets/custom_text_fields.dart';
import 'package:ishker_24/src/core/widgets/floating_bottom_area.dart';
import 'package:ishker_24/src/core/widgets/floating_button.dart';
import 'package:ishker_24/src/core/widgets/unfocus_widget.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/grnp/grnp_create/cubit/grnp_create_cubit.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';
import 'package:ishker_24/src/features/widgets/custom_button.dart';
import 'package:ishker_24/src/features/widgets/styled_toasts.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';
import 'package:permission_handler/permission_handler.dart';

class GrnpCreatePage extends StatelessWidget {
  const GrnpCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GrnpCreateCubit(sl()),
      child: const GrnpCreateView(),
    );
  }
}

class GrnpCreateView extends StatefulWidget {
  const GrnpCreateView({super.key});

  @override
  State<GrnpCreateView> createState() => _GrnpCreateViewState();
}

class _GrnpCreateViewState extends State<GrnpCreateView> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _passNumController = TextEditingController();
  final _phoneController = TextEditingController();

  late TextEditingController _innController;

  bool grnpCheck = false;
  bool terms = false;

  @override
  void initState() {
    super.initState();

    final pin = context.read<AuthCubit>().state.pin;
    _innController = TextEditingController(text: pin);
  }

  @override
  void dispose() {
    _idController.dispose();
    _passNumController.dispose();
    _innController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  XFile? file;

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    bool granted = false;

    if (Platform.isIOS) granted = true;
    if (Platform.isAndroid) {
      granted = await Permission.camera.request().isGranted;
      // if (granted) {
      //   //TODO: ???
      //   granted = await Permission.microphone.request().isGranted;
      // }
    }

    if (granted) {
      final descr = await ScannerUtils.getCamera(CameraLensDirection.front);
      if (!context.mounted) return;

      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.
      file = await Navigator.pushNamed(context, cameraRoute, arguments: descr)
          as XFile;

      setState(() {});

      dev.log("result is XFile: ${file?.name}");
    }
  }

  Widget userDataWidget() => Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, kToolbarHeight, 10, 0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  'Для завершения процесса регистрации и обеспечения безопасности вашего аккаунта, просим вас предоставить следующую дополнительную информацию: номер паспорта и ИНН.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s16W500(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: CustomTextField(
                        controller: _idController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z]'),
                          ),
                        ],
                        isId: true,
                        labelText: 'ID/AN',
                        maxLength: 2,
                        validator: AppInputValidators.emptyValidator,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      flex: 4,
                      child: CustomTextField(
                        controller: _passNumController,
                        maxLength: 7,
                        labelText: 'Номер Паспорта',
                        keyboardType: TextInputType.number,
                        validator: AppInputValidators.passportNumber,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _innController,
                  enabled: false,
                  maxLength: 14,
                  labelText: 'ИНН',
                  keyboardType: TextInputType.number,
                  validator: AppInputValidators.innValidator,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _phoneController,
                  prefixText: '+996 ',
                  labelText: 'Номер телефона',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    AppInputFormatters.phoneFormatter,
                  ],
                  validator: AppInputValidators.phoneValidator,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.color54B25AMain,
                      value: grnpCheck,
                      onChanged: (val) => setState(() => grnpCheck = val!),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Условия оферты',
                          style: AppTextStyles.s14W500().copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.color54B25AMain,
                            color: AppColors.color54B25AMain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.color54B25AMain,
                      value: terms,
                      onChanged: (val) => setState(() => terms = val!),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Соглашение на сбор, обработку, хранение и передачу персональных данных',
                          style: AppTextStyles.s14W500().copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.color54B25AMain,
                            color: AppColors.color54B25AMain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Spacer(),
                CustomButton(
                  radius: 16,
                  color: AppColors.color1EA31EGreen,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      if (grnpCheck == false || terms == false) {
                        AppSnackBar.showSnackBar('Отметьте все галочки');
                      } else {
                        context.read<GrnpCreateCubit>().userData(
                              _idController.text,
                              _passNumController.text,
                              _innController.text,
                              _phoneController.text,
                            );
                        // Navigator.pushNamed(context, grnpSelfieRoute);
                      }
                    }
                  },
                  child: Text(
                    'Далее',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s16W700(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );

  Widget imageWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.file(File(file!.path))),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => file = null),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 16,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.colorFF0000Red,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      margin: const EdgeInsets.only(left: 16, top: 24),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                  BlocConsumer<GrnpCreateCubit, GrnpCreateState>(
                    listenWhen: (p, c) => p.status != c.status,
                    listener: (context, state) {
                      switch (state.status) {
                        case RequestSuccess():
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            homeRoute,
                            (route) => false,
                          );
                        case RequestFailure(exception: Exception e):
                          AppSnackBar.showSnackBar(e.message);
                        default:
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          List<int> imageBytes =
                              await File(file!.path).readAsBytes();

                          if (!context.mounted) return;

                          context
                              .read<GrnpCreateCubit>()
                              .create(base64Encode(imageBytes));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.color34C759Green,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 55,
                            vertical: 16,
                          ),
                          margin: const EdgeInsets.only(top: 24, left: 28),
                          child: state.status is RequestLoading
                              ? const AppIndicator(color: Colors.white)
                              : const Icon(Icons.check, color: Colors.white),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      );

  Widget initialWidget() => FloatingBottomArea(
        areaContent: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: FloatingButton(
            bkgColor: AppColors.color54B25AMain,
            title: 'Сделать фото',
            onTap: () => _navigateAndDisplaySelection(context),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.selfieIdentIconSvg),
              const SizedBox(height: 22.0),
              Text(
                'Необходимо сфотографировать себя',
                style: AppTextStyles.s16W400().copyWith(height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              Text(
                'Важно!',
                style: AppTextStyles.s18W700().copyWith(
                  color: AppColors.colorFF0000Red,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Убедитесь, что на Вас нет\nочков или головного убора',
                style: AppTextStyles.s16W500().copyWith(height: 1.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: Scaffold(
        // appBar: const CustomAppBar(),
        body: SafeArea(
          child: BlocBuilder<GrnpCreateCubit, GrnpCreateState>(
            builder: (_, state) => !state.hasUserData
                ? userDataWidget()
                : file == null
                    ? initialWidget()
                    : imageWidget(),
          ),
        ),
      ),
    );
  }
}
