import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class ExpandedList extends StatefulWidget {
  const ExpandedList({
    super.key,
    this.image,
    this.color,
    this.items = const [],
    this.tapEnabled = true,
    required this.title,
    required this.selectedIndex,
    required this.onSelected,
  });
  final Widget? image;
  final String title;
  final List<String> items;
  final int? selectedIndex;
  final bool tapEnabled;
  final Function(int) onSelected;
  final Color? color;

  @override
  State<ExpandedList> createState() => _ExpandedListState();
}

class _ExpandedListState extends State<ExpandedList>
    with SingleTickerProviderStateMixin {
  late Animation<double> _expanded;
  late Animation _curved;
  late Animation<double> _offsetText;

  late Animation<double> _rotated;
  late Animation<double> _scaleImage;

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
    _scaleImage =
        Tween<double>(begin: 1, end: 0).animate(_curved as Animation<double>);

    _textStyle = TextStyleTween(
            begin: AppTextStyles.s16W500(), end: AppTextStyles.s16W500())
        .animate(_curved as Animation<double>);

    _offsetText = Tween<double>(begin: 0, end: widget.image == null ? 0 : -48)
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
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).unfocus();
        if (widget.tapEnabled) {
          if (_isExpanded) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          _isExpanded = !_isExpanded;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.tapEnabled ? Colors.white : AppColors.colorF3F4F5Grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Column(
            children: [
              ClipRect(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.color,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: _scaleImage.value,
                          child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 8),
                            child: widget.image,
                          ),
                        ),
                        Expanded(
                          child: Transform.translate(
                            offset: Offset(_offsetText.value, 0),
                            child: Text(
                              (_isExpanded || widget.selectedIndex == null)
                                  ? widget.title
                                  : widget.items[widget.selectedIndex!],
                              style: widget.tapEnabled
                                  ? _textStyle.value
                                  : _textStyle.value.copyWith(
                                      color: AppColors.color7A7A7AGrey,
                                    ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Transform.rotate(
                            angle: _rotated.value,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.items.map(
                          (e) {
                            final index = widget.items.indexOf(e);
                            return SizedBox(
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  widget.onSelected(index);
                                  _isExpanded = false;
                                  _controller.reverse();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    e,
                                    style: widget.selectedIndex != null &&
                                            widget.selectedIndex == index
                                        ? _textStyle.value
                                        : AppTextStyles.s16W500(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
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
