import 'package:flutter/material.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/widgets/unfocus_widget.dart';

class ScaffoldBackgroundImageWidget extends StatelessWidget {
  const ScaffoldBackgroundImageWidget({
    super.key,
    required this.body,
    this.appBar,
    this.bgColor,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        image: const DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage(AppImages.esiWaveImage),
        ),
      ),
      child: UnfocusWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: body,
          ),
        ),
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    super.key,
    this.appBar,
    this.bgColor,
    required this.slivers,
  });

  final SliverAppBar? appBar;
  final Color? bgColor;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        image: const DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage(AppImages.esiWaveImage),
        ),
      ),
      child: UnfocusWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [if (appBar != null) appBar!, ...slivers],
          ),
        ),
      ),
    );
  }
}
