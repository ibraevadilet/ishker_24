import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/search_vid_deatelnost_cubit/search_vid_deatelnost_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class RegisterIPTypeOfActivityScreen extends StatelessWidget {
  const RegisterIPTypeOfActivityScreen({super.key, required this.models});
  final List<TaxModel> models;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchVidDeatelnostCubit>()..getList(models),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Builder(
                builder: (context) => CustomTextField(
                  onChanged: (value) {
                    context.read<SearchVidDeatelnostCubit>().searchList(value);
                  },
                  hintText: 'Поиск',
                  prefixIcon: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppImages.searchIcon,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<SearchVidDeatelnostCubit, SearchVidDeatelnostState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: state.model.length,
                      separatorBuilder: (context, index) => const Column(
                        children: [
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(state.model[index]);
                        },
                        child: Text(
                          '${state.model[index].id} - ${state.model[index].text}',
                          style: AppTextStyles.s16W500(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
