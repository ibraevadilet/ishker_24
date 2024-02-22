// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:ishker_24/core/formatters/validators.dart';
// import 'package:ishker_24/core/functions/push_router_func.dart';
// import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';
// import 'package:ishker_24/features/home/domain/use_cases/check_has_ip_use_case.dart';
// import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
// import 'package:ishker_24/server/service_locator.dart';
// import 'package:ishker_24/theme/app_colors.dart';
// import 'package:ishker_24/theme/app_text_styles.dart';
// import 'package:ishker_24/widgets/custom_app_bar.dart';
// import 'package:ishker_24/widgets/custom_button.dart';
// import 'package:ishker_24/widgets/custom_text_fields.dart';
// import 'package:url_launcher/url_launcher.dart';

// @RoutePage()
// class CreateAccountNextScreen extends StatelessWidget {
//   const CreateAccountNextScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         backgroundColor: AppColors.backgroundColor,
//         title: 'Создание счета',
//         centerTitle: false,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Form(
//                   key: sl<RegisterClientUseCase>().okpoFormKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       CustomTextField(
//                         labelText: 'ОКПО',
//                         controller: sl<RegisterClientUseCase>().okpoController,
//                         validator: AppInputValidators.emptyValidator,
//                       ),
//                       const SizedBox(height: 8),
//                       CustomTextField(
//                         labelText: 'Регистрационный номер',
//                         controller:
//                             sl<RegisterClientUseCase>().regNumberController,
//                         validator: AppInputValidators.emptyValidator,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: GestureDetector(
//                 onTap: () async {
//                   final certUrl = sl<CheckHasIPUseCase>().certificatUrl;
//                   await launchUrl(
//                     Uri.parse(certUrl),
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(
//                       10,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'Просмотреть или скачать\nсвидетельство о гос. регистрации',
//                           style: AppTextStyles.s16W500(),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const Icon(
//                         Icons.arrow_forward_ios,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: CustomButton(
//                 onPress: () {
//                   if (sl<RegisterClientUseCase>()
//                       .okpoFormKey
//                       .currentState!
//                       .validate()) {
//                     AppRouting.pushFunction(const CreateAccountLastRoute());
//                   }
//                 },
//                 text: 'Далее',
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
