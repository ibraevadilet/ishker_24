import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/spaces.dart';

class SelectFilialWidget extends StatefulWidget {
  const SelectFilialWidget({super.key, required this.onSelectAdress});
  final Function(String bic) onSelectAdress;

  @override
  State<SelectFilialWidget> createState() => _SelectFilialWidgetState();
}

class _SelectFilialWidgetState extends State<SelectFilialWidget> {
  String? selecteAdress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          isScrollControlled: true,
          context: context,
          builder: (context) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 12,
                    width: context.width,
                  ),
                  Container(
                    height: 4,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.color6B7583Grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Филиал для открытия счета',
                    style: AppTextStyles.s16W500(),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      selecteAdress = 'г. Бишкек, ул. Московская 80/1';
                      widget.onSelectAdress('129058');
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: context.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Text(
                        'г. Бишкек, ул. Московская 80/1',
                        style: AppTextStyles.s16W500(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      selecteAdress = 'г. Ош, ул. Раззакова 50';
                      widget.onSelectAdress('129039');
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: context.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Text(
                        'г. Ош, ул. Раззакова 50',
                        style: AppTextStyles.s16W500(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.color7A7A7AGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: selecteAdress != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Филиал для открытия счета',
                          style: AppTextStyles.s12W600(
                            color: AppColors.color6B7583Grey,
                          ),
                        ),
                        Text(
                          selecteAdress!,
                          style: AppTextStyles.s16W600(),
                        ),
                      ],
                    )
                  : Text(
                      'Выберите филиал для открытия счета',
                      style: AppTextStyles.s16W600(),
                    ),
            ),
            const SizedBox(width: 10),
            RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset(
                AppImages.arrowForwardIcon,
                color: AppColors.color6B7583Grey,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
