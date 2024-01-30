import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppInputFormatters {
  static final phoneFormatter = MaskTextInputFormatter(
    mask: '(###) ###-###',
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
}
