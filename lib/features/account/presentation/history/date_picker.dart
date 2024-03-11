import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/custom_listtile.dart';

class DatePickWidget extends StatefulWidget {
  const DatePickWidget({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<DatePickWidget> createState() => _DatePickWidgetState();
}

class _DatePickWidgetState extends State<DatePickWidget> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTimeN _startDate =
      RestorableDateTimeN(DateTime.now().subtract(const Duration(days: 7)));
  final RestorableDateTimeN _endDate = RestorableDateTimeN(DateTime.now());

  late final RestorableRouteFuture<DateTimeRange?>
      _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
    onComplete: _selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _dateRangePickerRoute,
        arguments: <String, dynamic>{
          'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
          'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
        },
      );
    },
  );

  void _selectDateRange(DateTimeRange? newSelectedDate) {
    if (newSelectedDate != null) {
      context.read<HistoryCubit>().load(
            start: newSelectedDate.start,
            end: newSelectedDate.end,
          );
      setState(() {
        _startDate.value = newSelectedDate.start;
        _endDate.value = newSelectedDate.end;
      });
      Navigator.pop(context);
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  @pragma('vm:entry-point')
  static Route<DateTimeRange?> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: lightTheme.copyWith(
            primaryColor: AppColors.esiMainBlueColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.color54B25AMain,
            ),
          ),
          child: DateRangePickerDialog(
            restorationId: 'date_picker_dialog',
            initialDateRange:
                _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
            firstDate: DateTime(2023),
            currentDate: DateTime.now(),
            lastDate: DateTime.now(),
          ),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }

    return null;
  }

  void showDatePickModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.backgroundColor,
        builder: (_) {
          // return StatefulBuilder(builder: (context, st) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Показать операции',
                  style: AppTextStyles.s16W500(
                    color: AppColors.color2C2C2CBlack,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    CustomListTile(
                      title: 'За 7 дней',
                      ontap: () {
                        context.read<HistoryCubit>().load();
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomListTile(
                      title: 'За 30 дней',
                      ontap: () {
                        context.read<HistoryCubit>().load(
                              start: DateTime.now().days30,
                            );
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomListTile(
                        title: 'За 90 дней',
                        ontap: () {
                          context.read<HistoryCubit>().load(
                                start: DateTime.now().days90,
                              );

                          Navigator.pop(context);
                        }),
                    const SizedBox(height: 16),
                    CustomListTile(
                      title: 'За период',
                      ontap: () =>
                          _restorableDateRangePickerRouteFuture.present(),
                    ),
                    const SizedBox(height: 16),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDatePickModal(context),
      icon: SvgPicture.asset(
        'assets/images/calendar_icon.svg',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
