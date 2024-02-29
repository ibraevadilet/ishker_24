part of '../kkm_list_screen.dart';

class _KkmItem extends StatelessWidget {
  const _KkmItem({
    required this.kkm,
  });

  final MegaKassaKkmEntity kkm;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(MegaKassaKkmDetailRoute(cashbox: kkm));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.color2C2C2CBlack.withOpacity(
                0.08,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                kkm.name,
                style: AppTextStyles.s14W400(
                  color: AppColors.color2C2C2CBlack,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'РНМ: ${kkm.rnm.replaceFirst('00000', '')}',
                    textAlign: TextAlign.end,
                    style: AppTextStyles.s14W400(
                      color: AppColors.color2C2C2CBlack,
                    ),
                  ),
                  Text(
                    kkm.status.getTitle,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.s14W500(
                      color: kkm.status.getColor,
                    ),
                  ),
                  if (kkm.isMegaKassa)
                    Image.asset(
                      AppImages.megakassaLogo,
                      scale: 4,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
