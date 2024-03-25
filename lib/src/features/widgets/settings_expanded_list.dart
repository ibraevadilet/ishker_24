import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class SettingsExpandedList extends StatefulWidget {
  const SettingsExpandedList({
    super.key,
    required this.image,
    required this.children,
    required this.title,
    this.onExpanded,
  });
  final Widget image;
  final String title;
  final List<Widget> children;
  final Function(bool value)? onExpanded;

  @override
  State<SettingsExpandedList> createState() => _SettingsExpandedListState();
}

class _SettingsExpandedListState extends State<SettingsExpandedList>
    with SingleTickerProviderStateMixin {
  late Animation<double> _expanded;
  late Animation _curved;
  late Animation<double> _rotated;
  late Animation<Radius> _radius;
  late Animation<TextStyle> _textStyle;
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this);

    _curved = CurvedAnimation(curve: Curves.easeOutBack, parent: _controller);

    _expanded =
        Tween<double>(begin: 0, end: 1).animate(_curved as Animation<double>);

    _rotated = Tween<double>(begin: -2 * pi, end: -1.5 * pi)
        .animate(_curved as Animation<double>);

    _textStyle = TextStyleTween(
            begin: AppTextStyles.s16W600(), end: AppTextStyles.s16W500())
        .animate(_curved as Animation<double>);

    _radius = Tween<Radius>(
            begin: const Radius.circular(10), end: const Radius.circular(0))
        .animate(_curved as Animation<double>);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: () {
        if (_isExpanded) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        _isExpanded = !_isExpanded;
        if (widget.onExpanded != null) {
          widget.onExpanded!(_isExpanded);
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Column(
          children: [
            ClipRect(
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: _radius.value,
                    bottomRight: _radius.value,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: widget.image,
                    ),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: _textStyle.value,
                      ),
                    ),
                    Transform.rotate(
                        angle: _rotated.value,
                        child: SvgPicture.asset(
                          AppImages.arrowForwardIcon,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor:
                        _expanded.value >= 0.0 ? _expanded.value : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 14,
                      ),
                      child: Column(
                        children: widget.children,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
