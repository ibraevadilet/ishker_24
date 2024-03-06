import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppInputFormatters {
  static final amountFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d+\.?\d{0,2}'),
  );

  static final phoneFormatter = MaskTextInputFormatter(
    mask: '(###) ###-###',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  static final phoneFormatterZero = MaskTextInputFormatter(
    mask: '#### ## ## ##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  static final dateFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  static final phoneFormatterWith996 = MaskTextInputFormatter(
    mask: '+996 (###) ###-###',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  static final cardFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {'#': RegExp(r'[0-9]')},
  );
}
