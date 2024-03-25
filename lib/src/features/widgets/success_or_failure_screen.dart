// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ishker_24/core/images/app_images.dart';
// import 'package:ishker_24/theme/app_colors.dart';
// import 'package:ishker_24/theme/app_text_styles.dart';
// import 'package:ishker_24/theme/app_theme.dart';
// import 'package:ishker_24/widgets/custom_button.dart';

// @RoutePage()
// class SuccessOrFailureScreen extends StatelessWidget {
//   const SuccessOrFailureScreen({
//     super.key,
//     required this.onPress,
//     required this.title,
//     required this.subtitle,
//     required this.buttonText,
//     this.isSuccess = true,
//   });

//   final String title;
//   final String subtitle;
//   final String buttonText;
//   final VoidCallback onPress;
//   final bool isSuccess;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: lightTheme.copyWith(
//         dividerTheme: const DividerThemeData(color: Colors.transparent),
//       ),
//       child: Scaffold(
//         persistentFooterButtons: [
//           CustomButton(
//             aroundButtonPadding: const EdgeInsets.symmetric(
//               vertical: 16,
//               horizontal: 8,
//             ),
//             onPress: onPress,
//             radius: 16,
//             text: buttonText,
//           ),
//         ],
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   isSuccess
//                       ? AppImages.successCreatedAccountIcon
//                       : AppImages.failureIcon,
//                 ),
//                 Text(
//                   title,
//                   style: AppTextStyles.s18W700(
//                     color: isSuccess
//                         ? AppColors.color46CC6BGreen
//                         : AppColors.colorFC4637Red,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.s15W400(
//                     color: AppColors.color2C2C2CBlack,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
