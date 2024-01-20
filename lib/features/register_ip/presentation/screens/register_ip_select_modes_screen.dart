import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RegisterIpSelectModesScreen extends StatefulWidget {
  const RegisterIpSelectModesScreen({super.key, required this.models});
  final List<TaxModel> models;

  @override
  State<RegisterIpSelectModesScreen> createState() =>
      _RegisterIpSelectModesScreenState();
}

class _RegisterIpSelectModesScreenState
    extends State<RegisterIpSelectModesScreen> {
  List<String> ids = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.models.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.color54B25AMain,
                        value: ids.contains(widget.models[index].id),
                        onChanged: (_) {
                          if (ids.contains(widget.models[index].id)) {
                            ids.remove(widget.models[index].id);
                          } else {
                            ids.add(widget.models[index].id);
                          }
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.models[index].text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomButton(
                color: ids.isEmpty
                    ? AppColors.color6B7583Grey
                    : AppColors.color54B25AMain,
                onPress: () {
                  if (ids.isNotEmpty) {
                    Navigator.of(context).pop(ids);
                  }
                },
                text: 'Добавить',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
