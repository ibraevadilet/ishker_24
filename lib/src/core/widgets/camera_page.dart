// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.description});

  final CameraDescription description;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
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
      _initializeControllerFuture
          .then((value) => _controller.setFocusMode(FocusMode.auto));
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
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.resumed) {
      _controller.dispose();
      AutoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              style: AppTextStyles.s12W500(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 2),
                            SvgPicture.asset(AppImages.selfieAttentionIconSvg),
                            Image.asset(
                              AppImages.faceEllipseIcon,
                              height: MediaQuery.of(context).size.height * 0.35,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
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

                              if (context.mounted) {
                                Navigator.of(context).pop(photo);
                              }
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
