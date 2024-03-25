import 'package:intl/intl.dart';
import 'package:ishker_24/src/core/images/app_images.dart';

final currencyDisplayFormat = NumberFormat('#,##0.00', 'RU');

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
      case 'KGZ' || '417':
        return 'С';
      case 'Dollar':
        return '\$';
      default:
        return 'C';
    }
  }

  static String currencyName(String currancy) =>
      switch (currancy) { '417' => 'Сом', _ => '' };

  static String currencyCash(num value) =>
      currencyDisplayFormat.format(value).replaceAll(',', '.');
}
