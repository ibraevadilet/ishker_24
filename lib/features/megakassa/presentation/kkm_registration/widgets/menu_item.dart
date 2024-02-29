part of '../kkm_registration_screen.dart';

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.onPressed,
    required this.title,
    required this.canFill,
    required this.isFilled,
  });

  final String title;
  final VoidCallback onPressed;
  final bool canFill;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: canFill ? onPressed : null,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: isFilled ? AppColors.color54B25AMain : Colors.white,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.s16W600(
                  color: isFilled
                      ? AppColors.color54B25AMain
                      : AppColors.color2C2C2CBlack.withOpacity(
                          canFill ? 1 : 0.5,
                        ),
                ),
              ),
            ),
            SvgPicture.asset(
              AppImages.arrowForwardIcon,
              color: AppColors.color2C2C2CBlack.withOpacity(
                canFill ? 1 : 0.5,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
