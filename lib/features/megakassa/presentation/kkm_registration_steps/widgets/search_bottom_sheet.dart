import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

class MegaKassaSearchBottomSheet extends StatefulWidget {
  const MegaKassaSearchBottomSheet({
    super.key,
    required this.array,
    required this.title,
    required this.onSelected,
  });
  final List<String> array;
  final String title;
  final Function(String value) onSelected;

  @override
  State<MegaKassaSearchBottomSheet> createState() =>
      _MegaKassaSearchBottomSheetState();
}

class _MegaKassaSearchBottomSheetState
    extends State<MegaKassaSearchBottomSheet> {
  late final _filteredArray = ValueNotifier(widget.array);
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _filteredArray.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(
                  AppImages.searchIcon,
                  height: 18,
                  width: 18,
                  color: AppColors.color2C2C2CBlack.withOpacity(
                    0.5,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _searchController,
                builder: (context, _, __) {
                  return CustomTextField(
                    hintText: widget.title,
                    onChanged: (value) {
                      _filteredArray.value = widget.array
                          .where((text) =>
                              text.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    },
                    textStyle: AppTextStyles.s16W500(
                      color: AppColors.color2C2C2CBlack,
                    ),
                    controller: _searchController,
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              _filteredArray.value = widget.array;
                              _searchController.clear();
                            },
                            icon: const Icon(Icons.close),
                          )
                        : null,
                    hintStyle: AppTextStyles.s16W500(
                        color: AppColors.color2C2C2CBlack.withOpacity(
                      0.35,
                    )),
                    contentPadding: const EdgeInsets.fromLTRB(42, 15, 0, 8),
                    borderRadius: 8,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 540,
            child: ValueListenableBuilder(
              valueListenable: _filteredArray,
              builder: (context, _, __) {
                return _filteredArray.value.isNotEmpty
                    ? ListView.separated(
                        itemCount: _filteredArray.value.length,
                        padding: const EdgeInsets.only(bottom: 140, top: 22),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onSelected(_filteredArray.value[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 22,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                _filteredArray.value[index],
                                style: AppTextStyles.s16W500(
                                  color: AppColors.color2C2C2CBlack,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 52),
                        child: Text(
                          'Ничего не найдено',
                          style: AppTextStyles.s16W500(
                            color: AppColors.color2C2C2CBlack,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MegaKassaSearchSelectionBottomSheet extends StatefulWidget {
  const MegaKassaSearchSelectionBottomSheet({
    super.key,
    required this.array,
    required this.title,
    required this.onSelected,
    required this.initialSelectedArray,
  });
  final List<String> array;
  final List<String> initialSelectedArray;
  final String title;
  final Function(List<String> array) onSelected;

  @override
  State<MegaKassaSearchSelectionBottomSheet> createState() =>
      _MegaKassaSearchSelectionBottomSheetState();
}

class _MegaKassaSearchSelectionBottomSheetState
    extends State<MegaKassaSearchSelectionBottomSheet> {
  late final _filteredArray = ValueNotifier(widget.array);
  late final _selectedArray =
      ValueNotifier<List<String>>(widget.initialSelectedArray);
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _filteredArray.dispose();
    _searchController.dispose();
    _selectedArray.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SvgPicture.asset(
                      AppImages.searchIcon,
                      height: 18,
                      width: 18,
                      color: AppColors.color2C2C2CBlack.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _searchController,
                    builder: (context, _, __) {
                      return CustomTextField(
                        hintText: widget.title,
                        onChanged: (value) {
                          _filteredArray.value = widget.array
                              .where((text) => text
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        },
                        textStyle: AppTextStyles.s16W500(
                          color: AppColors.color2C2C2CBlack,
                        ),
                        controller: _searchController,
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  _filteredArray.value = widget.array;
                                  _searchController.clear();
                                },
                                icon: const Icon(Icons.close),
                              )
                            : null,
                        hintStyle: AppTextStyles.s16W500(
                            color: AppColors.color2C2C2CBlack.withOpacity(
                          0.35,
                        )),
                        contentPadding: const EdgeInsets.fromLTRB(42, 15, 0, 8),
                        borderRadius: 8,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 2),
              SizedBox(
                height: 540,
                child: ValueListenableBuilder(
                    valueListenable: _selectedArray,
                    builder: (context, _, __) {
                      return ValueListenableBuilder(
                        valueListenable: _filteredArray,
                        builder: (context, _, __) {
                          return _filteredArray.value.isNotEmpty
                              ? ListView.separated(
                                  itemCount: _filteredArray.value.length,
                                  padding: const EdgeInsets.only(
                                    bottom: 140,
                                    top: 22,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (_selectedArray.value.contains(
                                            _filteredArray.value[index])) {
                                          _selectedArray.value = [
                                            ..._selectedArray.value
                                              ..removeWhere(
                                                (e) =>
                                                    e ==
                                                    _filteredArray.value[index],
                                              )
                                          ];
                                        } else {
                                          _selectedArray.value = [
                                            ..._selectedArray.value,
                                            _filteredArray.value[index]
                                          ];
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 22,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Row(
                                          children: [
                                            if (_selectedArray.value.any(
                                                (element) =>
                                                    element ==
                                                    _filteredArray
                                                        .value[index]))
                                              SvgPicture.asset(
                                                AppImages.successCheck,
                                              ),
                                            if (!_selectedArray.value.any(
                                                (element) =>
                                                    element ==
                                                    _filteredArray
                                                        .value[index]))
                                              SvgPicture.asset(
                                                AppImages.successCheck,
                                                color: const Color(0xff6B7583),
                                              ),
                                            const SizedBox(width: 10),
                                            Flexible(
                                              child: Text(
                                                _filteredArray.value[index],
                                                style: AppTextStyles.s16W500(
                                                  color: AppColors
                                                      .color2C2C2CBlack,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 8),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 52),
                                  child: Text(
                                    'Ничего не найдено',
                                    style: AppTextStyles.s16W500(
                                      color: AppColors.color2C2C2CBlack,
                                    ),
                                  ),
                                );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          color: Colors.white,
          child: ValueListenableBuilder(
            valueListenable: _selectedArray,
            builder: (context, _, __) {
              return CustomButton(
                onPress: () {
                  widget.onSelected(_selectedArray.value);
                },
                isFullFilled: _selectedArray.value.isNotEmpty &&
                    widget.initialSelectedArray != _selectedArray.value,
                text: 'Применить',
              );
            },
          ),
        ),
      ],
    );
  }
}
