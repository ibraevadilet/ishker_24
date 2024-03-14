import 'package:flutter/widgets.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
