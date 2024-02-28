import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/custom_radio_widget.dart';

class SelectDocumentTypeWidget extends StatefulWidget {
  const SelectDocumentTypeWidget({super.key, required this.onChanged});
  final Function(int value) onChanged;

  @override
  State<SelectDocumentTypeWidget> createState() =>
      _SelectDocumentTypeWidgetState();
}

class _SelectDocumentTypeWidgetState extends State<SelectDocumentTypeWidget> {
  final ValueNotifier<int> groupValue = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: groupValue,
      builder: (_, value, child) {
        return Column(
          children: [
            CustomRadioWidget(
              value: 0,
              groupValue: value,
              title: 'Первоначальный',
              onChanged: (val) {
                groupValue.value = val!;
                widget.onChanged(val);
              },
            ),
            CustomRadioWidget(
              value: 1,
              groupValue: value,
              title: 'Уточненный',
              onChanged: (val) {
                groupValue.value = val!;
                widget.onChanged(val);
              },
            ),
            CustomRadioWidget(
              value: 3,
              groupValue: value,
              title: 'Ликвидационный',
              onChanged: (val) {
                groupValue.value = val!;
                widget.onChanged(val);
              },
            ),
          ],
        );
      },
    );
  }
}
