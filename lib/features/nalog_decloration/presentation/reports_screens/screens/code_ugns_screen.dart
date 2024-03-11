import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/ugns_model.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

class CodeUgnsScreen extends StatelessWidget {
  const CodeUgnsScreen({super.key, required this.ugnsModels});
  final List<UgnsModel> ugnsModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Код УГНС',
              style: AppTextStyles.s16W400(),
            ),
            const SizedBox(height: 19),
            Expanded(
              child: ListView.separated(
                itemCount: ugnsModels.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ugnsModels[index].displayTextWithCode,
                        style: AppTextStyles.s18W700(),
                      ),
                      const SizedBox(height: 22),
                      const Divider(),
                    ],
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
