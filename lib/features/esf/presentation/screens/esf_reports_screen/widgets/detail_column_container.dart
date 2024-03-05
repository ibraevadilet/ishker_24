import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class DetailColumnContainer extends StatelessWidget {
  const DetailColumnContainer({
    super.key,
    required this.title,
    required this.value,
    this.color = Colors.black,
  });
  final String title;
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return value.isNotEmpty
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.s14W500(
                          color: AppColors.color6B7583Grey),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: title == 'documentUuid'
                          ? () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: value,
                                ),
                              );
                            }
                          : null,
                      child: Text(
                        value,
                        style: AppTextStyles.s14W500(
                          color: color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
            ],
          )
        : const SizedBox();
  }
}
