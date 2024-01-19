import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/register_oep_cubit/register_oep_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

@RoutePage()
class SelfiePreviewScreen extends StatefulWidget {
  const SelfiePreviewScreen(this.path, this.onCheck, {Key? key})
      : super(key: key);
  final String? path;
  final Function onCheck;

  @override
  State<SelfiePreviewScreen> createState() => _SelfiePreviewScreenState();
}

class _SelfiePreviewScreenState extends State<SelfiePreviewScreen>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<RegisterOepCubit>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.file(
                  File(widget.path!),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await context.router.pop();
                          widget.onCheck(false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 55,
                            vertical: 16,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.colorFF0000Red,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          margin: const EdgeInsets.only(
                            left: 16,
                            top: 24,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BlocConsumer<RegisterOepCubit, RegisterOepState>(
                        listener: (context, state) {
                          state.whenOrNull(
                            error: (error) {
                              AppSnackBar.showSnackBar(error);
                            },
                            success: () async {
                              await context.router.pop();
                              widget.onCheck(true);
                            },
                          );
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () async {
                              if (!state.isLoading) {
                                context.read<RegisterOepCubit>().register();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.color34C759Green,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55,
                                vertical: 16,
                              ),
                              margin: const EdgeInsets.only(
                                top: 24,
                                left: 28,
                              ),
                              child: state.isLoading
                                  ? const AppIndicator(color: Colors.white)
                                  : const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
