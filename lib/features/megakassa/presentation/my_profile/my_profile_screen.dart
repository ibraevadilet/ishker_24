import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/megakassa/presentation/my_profile/cubit/get_profile_info_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class MegaKassaMyProfileScreen extends StatelessWidget {
  const MegaKassaMyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: BlocProvider.value(
        value: sl<MegaKassaGetProfileInfoCubit>()..getProfileInfo(),
        child: Scaffold(
          backgroundColor: const Color(0xffF3F4F5),
          appBar: CustomAppBar(
            title: 'Мой профиль',
            titleTextStyle: AppTextStyles.s16W700(
              color: AppColors.color2C2C2CBlack,
            ),
            backgroundColor: const Color(0xffF3F4F5),
            centerTitle: false,
          ),
          body: BlocBuilder<MegaKassaGetProfileInfoCubit, GetProfileInfoState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const AppIndicator(),
                success: (profile) => ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        SvgPicture.asset(AppImages.userAvatar),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.clientDetails?.companyName ?? '-',
                                style: AppTextStyles.s16W700(
                                  color: AppColors.color54B25AMain,
                                ),
                              ),
                              Text(
                                'Баланс: ${profile.balance} сом',
                                style: AppTextStyles.s16W500(
                                  color: AppColors.color54B25AMain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildInfoRow(
                      title: 'Тип НП:',
                      info:
                          profile.clientDetails?.type?.toLowerCase() == 'entity'
                              ? 'Плательщик ндс'
                              : 'Неплательщик ндс',
                    ),
                    _buildInfoRow(
                      title: 'Инн:',
                      info: profile.clientDetails?.tin,
                    ),
                    _buildInfoRow(
                      title: 'ФИО:',
                      info: profile.clientDetails?.fio,
                    ),
                    _buildInfoRow(
                      title: 'Логин:',
                      info: profile.clientDetails?.login,
                    ),
                    _buildInfoRow(
                      title: 'Наимен. юр. лица:',
                      info: profile.clientDetails?.companyName,
                    ),
                    _buildInfoRow(
                      title: 'ОКПО:',
                      info: profile.clientDetails?.okpo,
                    ),
                    _buildInfoRow(
                      title: 'Дата начала договора:',
                      info: DateFormat('dd.MM.yyyy').format(
                        profile.clientDetails?.contractStartDate ??
                            DateTime(1000),
                      ),
                    ),
                    _buildInfoRow(
                      title: 'БИК:',
                      info: profile.clientDetails?.bik,
                    ),
                    _buildInfoRow(
                      title: 'Расчетный счет:',
                      info: profile.clientDetails?.checkingAccount,
                    ),
                    _buildInfoRow(
                      title: '№ Свид. о гос.регистр.:',
                      info:
                          profile.clientDetails?.registrationCertificateNumber,
                    ),
                    _buildInfoRow(
                      title: 'ФИО ответст. лица:',
                      info: profile.clientDetails?.responsiblePerson,
                    ),
                    _buildInfoRow(
                      title: 'Юр. адрес:',
                      info: profile.clientDetails?.address,
                    ),
                    _buildInfoRow(
                      title: 'Контактный телефон:',
                      info: '+${profile.clientDetails?.phoneNum}',
                    ),
                    _buildInfoRow(
                      title: 'Лицевой счет:',
                      info: profile.clientDetails?.ls,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String title,
    required String? info,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: AppTextStyles.s16W500(
                color: AppColors.color6B7583Grey,
              ),
            ),
          ),
          Flexible(
            child: Text(
              info ?? '-',
              textAlign: TextAlign.right,
              style: AppTextStyles.s16W500(
                color: AppColors.color2C2C2CBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
