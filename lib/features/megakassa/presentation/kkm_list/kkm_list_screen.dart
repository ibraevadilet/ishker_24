import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/enums/kkm_status.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_list/cubit/get_kkm_list_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

part 'widgets/kkm_item.dart';

@RoutePage()
class MegaKassaKkmListScreen extends StatefulWidget {
  const MegaKassaKkmListScreen({super.key});

  @override
  State<MegaKassaKkmListScreen> createState() => _MegaKassaKkmListScreenState();
}

class _MegaKassaKkmListScreenState extends State<MegaKassaKkmListScreen> {
  final _filteredList = ValueNotifier<List<MegaKassaKkmEntity>>([]);
  final _nonFilteredList = <MegaKassaKkmEntity>[];

  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  final _hasFocus = ValueNotifier(false);
  final _dropDownValue = ValueNotifier<KkmStatus>(KkmStatus.all);

  final _cubit = sl<MegaKassaGetKkmListCubit>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _hasFocus.value = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _filteredList.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    _hasFocus.dispose();
    _dropDownValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F4F5),
        appBar: _buildAppBar,
        body: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xffF3F4F5),
                pinned: true,
                leadingWidth: 0,
                leading: const Offstage(),
                titleSpacing: 16,
                title: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                            valueListenable: _hasFocus,
                            builder: (context, _, __) {
                              return CustomTextField(
                                controller: _searchController,
                                focusNode: _focusNode,
                                hintText: 'Наименование, РНМ',
                                height: 38,
                                textStyle: AppTextStyles.s14W500(
                                  color: AppColors.color2C2C2CBlack,
                                ),
                                hintStyle: AppTextStyles.s14W500(
                                    color:
                                        AppColors.color2C2C2CBlack.withOpacity(
                                  0.35,
                                )),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(32, 6, 0, 8),
                                borderRadius: 8,
                                borderColor: _focusNode.hasFocus
                                    ? AppColors.color54B25AMain
                                    : AppColors.color2C2C2CBlack,
                                onChanged: _onSearch,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      flex: 2,
                      child: ValueListenableBuilder(
                        valueListenable: _dropDownValue,
                        builder: (context, _, __) {
                          return Container(
                            height: 38,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: (_dropDownValue.value != KkmStatus.all)
                                    ? AppColors.color54B25AMain
                                    : AppColors.color2C2C2CBlack,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<KkmStatus>(
                              value: _dropDownValue.value == KkmStatus.all
                                  ? null
                                  : _dropDownValue.value,
                              hint: Text(
                                'Статус',
                                style: AppTextStyles.s14W500(
                                    color:
                                        AppColors.color2C2C2CBlack.withOpacity(
                                  0.35,
                                )),
                              ),
                              isExpanded: true,
                              style: AppTextStyles.s14W500(
                                color: AppColors.color2C2C2CBlack,
                              ),
                              icon: SvgPicture.asset(AppImages.arrowDown),
                              items: KkmStatus.values
                                  .map((e) => DropdownMenuItem<KkmStatus>(
                                        value: e,
                                        child: Text(e.getTitle),
                                      ))
                                  .toList(),
                              onChanged: _onSearch,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<MegaKassaGetKkmListCubit, MegaKassaGetKkmListState>(
                bloc: _cubit,
                listener: (context, state) {
                  state.whenOrNull(
                    success: (kkms) {
                      _nonFilteredList.addAll(kkms);
                      _filteredList.value = kkms;
                    },
                  );
                },
                builder: (context, state) {
                  return state.when(
                    loading: () => const SliverFillRemaining(
                      child: AppIndicator(),
                    ),
                    error: (text) => SliverFillRemaining(
                      child: AppErrorText(error: text),
                    ),
                    empty: () => _buildEmptyState,
                    success: (kkms) => ValueListenableBuilder(
                      valueListenable: _filteredList,
                      builder: (context, _, __) {
                        return _filteredList.value.isEmpty
                            ? _buildEmptySearchState
                            : SliverList.builder(
                                itemCount: _filteredList.value.length,
                                itemBuilder: (context, index) => _KkmItem(
                                  kkm: _filteredList.value[index],
                                ),
                              );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SliverFillRemaining get _buildEmptySearchState {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.kkmEmpty),
          const SizedBox(height: 56),
          Text(
            'Кассы не найдены',
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W500(
              color: AppColors.color2C2C2CBlack,
            ),
          ),
        ],
      ),
    );
  }

  CustomAppBar get _buildAppBar {
    return CustomAppBar(
      title: 'Список касс',
      titleTextStyle: AppTextStyles.s16W700(
        color: AppColors.color2C2C2CBlack,
      ),
      backgroundColor: const Color(0xffF3F4F5),
      centerTitle: false,
      actions: [
        TextButton.icon(
          onPressed: () {
            context.router
                .push(const MegaKassaKkmRegistrationRoute())
                .then((value) {
              _cubit.getKkmList();
            });
          },
          icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.color54B25AMain,
            ),
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
          label: Text(
            'Добавить',
            style: AppTextStyles.s14W600(
              color: AppColors.color54B25AMain,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildEmptyState {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(AppImages.kkmEmpty),
          const SizedBox(height: 56),
          Text(
            'У вас пока нет касс',
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W500(
              color: AppColors.color2C2C2CBlack,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Для создания касса нажмите на кнопку “Добавить кассу”',
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W500(
              color: AppColors.color6B7583Grey,
            ),
          ),
          const Spacer(),
          CustomButton(
            aroundButtonPadding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            onPress: () {
              context.router.push(const MegaKassaKkmRegistrationRoute());
            },
            radius: 16,
            text: 'Добавить кассу',
          ),
        ],
      ),
    );
  }

  void _onSearch(value) {
    if (value is KkmStatus) {
      _dropDownValue.value = value;
    }

    final searchText = _searchController.text.toLowerCase();

    if (_dropDownValue.value != KkmStatus.all) {
      _filteredList.value = _nonFilteredList
          .where((kkm) =>
              (kkm.name.toLowerCase().contains(searchText) ||
                  kkm.rnm
                      .replaceFirst('00000', '')
                      .toLowerCase()
                      .contains(searchText)) &&
              kkm.status.getTitle.toLowerCase().contains(
                    _dropDownValue.value.getTitle.toLowerCase(),
                  ))
          .toList();
    } else {
      _filteredList.value = _nonFilteredList
          .where((kkm) =>
              kkm.name.toLowerCase().contains(searchText) ||
              kkm.rnm
                  .replaceFirst('00000', '')
                  .toLowerCase()
                  .contains(searchText))
          .toList();
    }
  }
}
