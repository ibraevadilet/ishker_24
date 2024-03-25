import 'package:flutter/material.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class IshkerDialog {
  static showDraggableBottomSheet({
    required BuildContext context,
    required Widget child,
    bool useRootNavigator = false,
    bool isScrollControlled = true,
    double initialChildSize = 0.5,
    double maxChildSize = 0.9,
    String? title,
    Function(dynamic)? then,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      enableDrag: true,
      useRootNavigator: useRootNavigator,
      backgroundColor: AppColors.backgroundColor,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            maxChildSize: maxChildSize,
            minChildSize: 0.3,
            initialChildSize: initialChildSize,
            builder: (context, controller2) {
              return CustomScrollView(
                primary: false,
                controller: controller2,
                slivers: [
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 32,
                        height: 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.color6B7583Grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (title != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.s16W500(
                              color: AppColors.color2C2C2CBlack,
                            ),
                          ),
                        ),
                      if (title != null) const SizedBox(height: 24),
                      child,
                    ],
                  ))
                ],
              );
            },
          ),
        );
      },
    ).then((value) {
      then?.call(value);
    });
  }
}
