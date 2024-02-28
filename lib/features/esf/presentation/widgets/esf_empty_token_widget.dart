import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_check_cubit/esf_check_cubit.dart';
import 'package:ishker_24/features/esf/presentation/cubits/save_token_cubit/save_token_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/custom_text_field.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:url_launcher/url_launcher.dart';

class EsfEmptyTokenWidget extends StatefulWidget {
  const EsfEmptyTokenWidget({super.key});

  @override
  State<EsfEmptyTokenWidget> createState() => _EsfEmptyTokenWidgetState();
}

class _EsfEmptyTokenWidgetState extends State<EsfEmptyTokenWidget> {
  final tokenController = TextEditingController();
  String? filePath;
  String? fileName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text:
                          'Для просмотра электронных счет-фактур\nвам необходимо авторизоваться в ',
                      style: AppTextStyles.s16W500(),
                      children: [
                        TextSpan(
                            text: 'Кабинете Налогоплательщика',
                            style: AppTextStyles.s16W600().copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.color54B25AMain,
                                decorationColor: AppColors.color54B25AMain),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchUrl(
                                  Uri.parse('https://cabinet.salyk.kg/'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }),
                        const TextSpan(
                          text:
                              ' и сгенерировать токен в разделе «Генерация токена».',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 56),
                  Text(
                    'Загрузите полученный токен в следующее\nполе:',
                    style: AppTextStyles.s14W500(),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: tokenController,
                    enabled: fileName == null,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['txt'],
                      );

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        filePath = file.path;
                        fileName = result.files.first.name;
                        tokenController.clear();
                        setState(() {});
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: Text(
                      'Загрузить файл',
                      style: AppTextStyles.s16W500(
                        color: AppColors.color54B25AMain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (fileName != null)
                    Text(
                      'Выбранный файл:',
                      style: AppTextStyles.s15W400(
                          color: AppColors.color6B7583Grey),
                    ),
                  if (fileName != null)
                    Text(
                      fileName!,
                      style: AppTextStyles.s16W600(),
                    ),
                  const SizedBox(height: 16),
                  if (fileName != null)
                    InkWell(
                      onTap: () {
                        setState(() {
                          fileName = null;
                          filePath = null;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Удалить',
                            style: AppTextStyles.s15W600(color: Colors.red),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.close, color: Colors.red),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<SaveTokenCubit, SaveTokenState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.read<EsfCheckCubit>().emitHasToken();
                  },
                );
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state.isLoading,
                  onPress: () {
                    if (filePath == null && tokenController.text.isEmpty) {
                      AppSnackBar.showSnackBar('Загрузите токен!');
                    } else if (filePath != null) {
                      context.read<SaveTokenCubit>().saveToken(
                          data: filePath!, isFile: true, fileName: fileName);
                    } else if (tokenController.text.isNotEmpty) {
                      context
                          .read<SaveTokenCubit>()
                          .saveToken(data: tokenController.text, isFile: false);
                    }
                  },
                  text: 'Принять',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
