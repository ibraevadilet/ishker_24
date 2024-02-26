import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/formatters/input_formatters.dart';
import 'package:ishker_24/src/core/formatters/validators.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/core/utils/scanner_utils.dart';
import 'package:ishker_24/src/core/widgets/custom_app_bar.dart';
import 'package:ishker_24/src/core/widgets/custom_text_fields.dart';
import 'package:ishker_24/src/core/widgets/floating_bottom_area.dart';
import 'package:ishker_24/src/core/widgets/floating_button.dart';
import 'package:ishker_24/src/core/widgets/unfocus_widget.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/grnp/grnp_create/cubit/grnp_create_cubit.dart';
import 'package:ishker_24/src/features/auth/view/widgets/app_error_text.dart';
import 'package:ishker_24/src/features/auth/view/widgets/app_indicator.dart';
import 'package:ishker_24/src/features/auth/view/widgets/custom_button.dart';
import 'package:ishker_24/src/features/auth/view/widgets/styled_toasts.dart';
import 'package:ishker_24/src/features/signup/view/signup_cubit/signup_cubit.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'oep_terms_cubit/oep_terms_cubit.dart';

class OepSignUpPage extends StatelessWidget {
  const OepSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OepTermsCubit(sl())),
        BlocProvider(create: (_) => SignUpCubit(signUpUseCase: sl())),
      ],
      child: const OepSignUpView(),
    );
  }
}

class OepSignUpView extends StatefulWidget {
  const OepSignUpView({super.key});

  @override
  State<OepSignUpView> createState() => _OepSignUpViewState();
}

class _OepSignUpViewState extends State<OepSignUpView> {
  final _formKey = GlobalKey<FormState>();
  final innController = TextEditingController();
  final idController = TextEditingController();
  final passNumberController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  bool isChecked = false;

  XFile? file;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getTerms());
  }

  @override
  void dispose() {
    innController.dispose();
    idController.dispose();
    passNumberController.dispose();
    phoneController.dispose();
    emailController.dispose();

    super.dispose();
  }

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

  Future<void> _getTerms() async {
    final temp = Platform.isIOS
        ? await getTemporaryDirectory()
        : await getExternalStorageDirectory();
    final file = File('${temp?.path}/ISHKER.pdf');

    if (mounted) context.read<OepTermsCubit>().load(file.path);
  }

  Widget userDataWidget() => UnfocusWidget(
        child: Scaffold(
          // backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              const CustomSliverAppbar(title: 'Удаленное получение ОЭП'),
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        CustomTextField(
                          maxLength: 14,
                          labelText: 'ИНН',
                          keyboardType: TextInputType.number,
                          validator: AppInputValidators.innValidator,
                          controller: innController,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: CustomTextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z]'),
                                  )
                                ],
                                isId: true,
                                controller: idController,
                                labelText: 'ID/AN',
                                maxLength: 2,
                                validator: AppInputValidators.emptyValidator,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              flex: 4,
                              child: CustomTextField(
                                controller: passNumberController,
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
                          prefixText: '+996 ',
                          controller: phoneController,
                          labelText: 'Номер телефона',
                          keyboardType: TextInputType.number,
                          inputFormatters: [AppInputFormatters.phoneFormatter],
                          validator: AppInputValidators.phoneValidator,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: emailController,
                          labelText: 'Адрес электронной почты',
                          keyboardType: TextInputType.emailAddress,
                          validator: AppInputValidators.emptyValidator,
                        ),
                        const SizedBox(height: 16),
                        // const RegisterOEPCheckBoxWidget(),
                        Row(
                          children: [
                            SizedBox(
                              width: 16,
                              child: Checkbox(
                                activeColor: AppColors.color54B25AMain,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: const BorderSide(width: 2.0),
                                value: isChecked,
                                onChanged: (val) =>
                                    setState(() => isChecked = val!),
                              ),
                            ),
                            const SizedBox(width: 14),
                            BlocBuilder<OepTermsCubit, OepTermsState>(
                              builder: (context, state) => switch (state) {
                                OepTermsLoading() => const Center(
                                    child: AppIndicator(
                                      color: AppColors.color54B25AMain,
                                    ),
                                  ),
                                OepTermsFailure() =>
                                  AppErrorText(error: state.exception.message),
                                _ => Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (state is OepTermsSuccess) {
                                          Navigator.pushNamed(
                                            context,
                                            pdfRoute,
                                            arguments: state.path,
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Я соглашаюсь на создание учетной записи в системе ЕСИ и предоставляю необходимую информацию для регистрации.',
                                        style: AppTextStyles.s14W400().copyWith(
                                          color: AppColors.color34C759Green,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColors.color34C759Green,
                                        ),
                                      ),
                                    ),
                                  ),
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              radius: 16,
              color: AppColors.color1EA31EGreen,
              onPress: () {
                if (_formKey.currentState?.validate() != true) return;
                if (!isChecked) {
                  AppSnackBar.showToastAbaveSheet(
                    context,
                    'Отметьте все галочки',
                  );

                  return;
                }

                context.read<SignUpCubit>().userData(
                      passSeries: idController.text,
                      passNumbers: passNumberController.text,
                      pin: innController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                    );
              },
              child: Text(
                'Далее',
                textAlign: TextAlign.center,
                style: AppTextStyles.s16W700(color: Colors.white),
              ),
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
                            loginRoute,
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
                              .read<SignUpCubit>()
                              .register(base64Encode(imageBytes));
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (_, state) => !state.hasUserData
          ? userDataWidget()
          : Scaffold(
              // appBar: const CustomAppBar(),
              body: SafeArea(
                child: file == null ? initialWidget() : imageWidget(),
              ),
            ),
    );
  }
}
