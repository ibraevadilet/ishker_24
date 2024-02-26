import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart';
import 'package:ishker_24/features/my_ip/presentation/my_certificate_screen/cubit/download_certificate_pdf_cubit.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';

import '../my_ip_main_screen/widgets/copy_container_widget.dart';

@RoutePage()
class MyCertficateScreen extends StatelessWidget {
  const MyCertficateScreen({
    super.key,
    this.certUrl,
    required this.model,
  });
  final String? certUrl;
  final CheckHasIPModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Свидетельство ИП',
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: model.isNewIp
              ? BlocProvider(
                  create: (context) =>
                      DownloadCertificatePdfCubit()..downloadPdf(certUrl!),
                  child: BlocBuilder<DownloadCertificatePdfCubit,
                      DownloadCertificatePdfState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (path) {
                          final pdfController = PdfController(
                            document: PdfDocument.openFile(path),
                          );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 24),
                              Expanded(
                                child: PdfView(
                                  controller: pdfController,
                                ),
                              ),
                              const SizedBox(height: 22),
                              GestureDetector(
                                onTap: () {
                                  Share.shareXFiles([XFile(path)]);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.shareIcon,
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        'Поделиться',
                                        style: AppTextStyles.s16W600(
                                          color: AppColors.color54B25AMain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(height: 26),
                    const SizedBox(height: 12),
                    CopyContainerWidget(
                      title: 'ФИО',
                      subTitle:
                          '${model.middleName} ${model.firstName} ${model.lastName}',
                    ),
                    CopyContainerWidget(
                      title: 'ИНН',
                      subTitle: model.tin!,
                    ),
                    CopyContainerWidget(
                      title: 'Дата регистрации',
                      subTitle:
                          AppDateFormats.formatDdMMYyyy.format(model.created!),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
