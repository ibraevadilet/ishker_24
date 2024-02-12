import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class MyCertficateScreen extends StatelessWidget {
  const MyCertficateScreen({super.key, required this.certUrl});
  final String certUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Свидетельство ИП',
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: const PDF().cachedFromUrl(certUrl),
            ),
            const SizedBox(height: 22),
            GestureDetector(
              onTap: () {
                Share.share(AppImages.ipImage);
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
        ),
      ),
    );
  }
}

Future<void> _launchPDF(String pdfUrl) async {
  if (await canLaunchUrl(Uri.parse(pdfUrl))) {
    await launchUrl(Uri.parse(pdfUrl));
  } else {
    throw 'Could not launch $pdfUrl';
  }
}
