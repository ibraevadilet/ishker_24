import 'package:flutter/material.dart';

extension GetSizes on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get bottomForBottomShhet => MediaQuery.of(this).viewInsets.bottom;
  bool get hasBottomPadding => MediaQuery.of(this).padding.bottom > 0;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get topPadding => MediaQuery.of(this).padding.top;
  FocusNode get focusScope => FocusScope.of(this);
}
