import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';

class InputBorders {
  static OutlineInputBorder esiBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.color617796Grey.withOpacity(0.05),
      width: 1,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const OutlineInputBorder outlineBorderColorE5E5E5Width1Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const OutlineInputBorder outlineBorderColorGreenWidth2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const OutlineInputBorder outlineBordercolorF68080Width2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );

  static const UnderlineInputBorder unOutlineBorderColorE5E5E5Width1 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  );
  static const UnderlineInputBorder unOutlineBorderColorGreenWidth2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
  );
  static const UnderlineInputBorder unOutlineBordercolorF68080Width2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
  );
}
