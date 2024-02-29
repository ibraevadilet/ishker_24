import 'dart:ui';

import 'package:ishker_24/theme/app_colors.dart';

enum KkmStatus {
  all,
  registration,
  ready,
  rejected,
  blocked,
  stopped;

  String get getTitle {
    switch (this) {
      case KkmStatus.ready:
        return 'Готов';
      case KkmStatus.blocked:
        return 'Заблокирован';
      case KkmStatus.stopped:
        return 'Остановлен';
      case KkmStatus.registration:
        return 'Регистрация';
      case KkmStatus.rejected:
        return 'Отклонен';
      default:
        return 'Все';
    }
  }

  Color get getColor {
    switch (this) {
      case KkmStatus.ready:
        return AppColors.color54B25AMain;
      case KkmStatus.blocked:
        return AppColors.colorFC4637Red;
      case KkmStatus.stopped:
        return const Color(0xffFF9D4D);
      case KkmStatus.registration:
        return const Color(0xff2067BC);
      default:
        return AppColors.color2C2C2CBlack.withOpacity(0.35);
    }
  }
}
