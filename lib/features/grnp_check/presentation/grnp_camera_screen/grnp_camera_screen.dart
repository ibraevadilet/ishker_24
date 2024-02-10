// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/grnp_cubit/grnp_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

@RoutePage()
class GrnpCameraScreen extends StatefulWidget {
  const GrnpCameraScreen({
    Key? key,
    required this.description,
  }) : super(key: key);
  final CameraDescription description;

  @override
  State<GrnpCameraScreen> createState() => _GrnpCameraScreenState();
}

class _GrnpCameraScreenState extends State<GrnpCameraScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = CameraController(
      widget.description,
      ResolutionPreset.high,
    );
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      _initializeControllerFuture = _controller.initialize();
      _initializeControllerFuture.then((value) => {
            _controller.setFocusMode(FocusMode.auto),
          });
    } catch (e) {
      debugPrint('error $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      _controller.dispose();
      AutoRouter.of(context).pop();
    } else if (state == AppLifecycleState.resumed) {
      _controller.dispose();
      AutoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<GRNPCubit>(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.previewSize!.height /
                          _controller.value.previewSize!.width,
                      child: CameraPreview(
                        _controller,
                        child: Padding(
                            padding: EdgeInsets.all(Platform.isIOS ? 20 : 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Для прохождения успешной идентификации лицо должно быть хорошо освещено.',
                                  style: AppTextStyles.s12W500(
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 2),
                                SvgPicture.asset(
                                    AppImages.selfieAttentionIconSvg),
                                Image.asset(
                                  AppImages.faceEllipseIcon,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                const SizedBox(height: 10.0),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Посмотрите на камеру и поместите лицо в овал для проверки',
                            style: AppTextStyles.s12W500(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Builder(
                            builder: (context) => TextButton(
                              child: const Icon(
                                Icons.camera,
                                size: 72,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                final photo = await _controller.takePicture();
                                List<int> imageBytes =
                                    await File(photo.path).readAsBytes();
                                String photoBase64 = base64Encode(imageBytes);
                                context.read<GRNPCubit>().getPhoto(photoBase64);
                                AppRouting.pushFunction(
                                  GrnpSelfiePreviewRoute(
                                    path: photo.path,
                                    onCheck: (check) {
                                      if (check == true) {
                                        AppRouting.pushFunction(
                                          const BottomNavigatorRoute(),
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
