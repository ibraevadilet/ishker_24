import 'package:ishker_24/core/images/app_images.dart';

class AppCurrencyFormatter {
  static String cuccancyIcon(String currancy) {
    switch (currancy) {
      case 'KGZ':
        return AppImages.accountIconComCurrancy;
      case 'Dollar':
        return AppImages.accountIconDollarCurrancy;
      default:
        return AppImages.bankAcoountIcon;
    }
  }

  static String cuccancyType(String currancy) {
    switch (currancy) {
      case 'KGZ':
        return 'С';
      case 'Dollar':
        return '\$';
      default:
        return 'C';
    }
  }
}
