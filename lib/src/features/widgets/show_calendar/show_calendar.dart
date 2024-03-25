// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:ishker_24/theme/app_colors.dart';
// import 'package:ishker_24/theme/app_text_styles.dart';
// import 'package:table_calendar/table_calendar.dart';

// void showCalendar(BuildContext context, Function(DateTime start) onTap) {
//   initializeDateFormatting();
//   final focusedDay = DateTime.now();
//   DateTime? selectedDay;

//   showDialog(
//     context: context,
//     builder: (context) => StatefulBuilder(builder: (context, setState) {
//       return AlertDialog(
//         insetPadding: EdgeInsets.zero,
//         contentPadding: EdgeInsets.zero,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         content: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.grey[200],
//           ),
//           height: 550,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 TableCalendar(
//                   locale: 'ru_RU',
//                   startingDayOfWeek: StartingDayOfWeek.monday,
//                   headerStyle: HeaderStyle(
//                       leftChevronIcon: const Icon(
//                         Icons.chevron_left,
//                       ),
//                       rightChevronIcon: const Icon(
//                         Icons.chevron_right,
//                       ),
//                       titleTextStyle: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.w700),
//                       titleCentered: true,
//                       titleTextFormatter: (date, locale) =>
//                           DateFormat.MMMM('ru').format(date),
//                       formatButtonVisible: false,
//                       headerPadding: const EdgeInsets.only(top: 20, bottom: 30),
//                       rightChevronPadding: const EdgeInsets.only(right: 30),
//                       leftChevronPadding: const EdgeInsets.only(left: 30)),
//                   calendarStyle: CalendarStyle(
//                     withinRangeTextStyle: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400),
//                     selectedTextStyle: AppTextStyles.s15W400(),
//                     rangeEndTextStyle: AppTextStyles.s15W400(),
//                     rangeStartTextStyle: AppTextStyles.s15W400(),
//                     rangeHighlightColor: AppColors.color54B25AMain,
//                     rangeEndDecoration: const BoxDecoration(
//                         color: AppColors.color54B25AMain,
//                         shape: BoxShape.circle),
//                     rangeStartDecoration: const BoxDecoration(
//                         color: AppColors.color54B25AMain,
//                         shape: BoxShape.circle),
//                     defaultTextStyle: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500),
//                     weekendTextStyle: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500),
//                     todayDecoration: const BoxDecoration(
//                         color: AppColors.color54B25AMain,
//                         shape: BoxShape.circle),
//                     todayTextStyle: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   daysOfWeekStyle: const DaysOfWeekStyle(
//                       weekendStyle: TextStyle(color: AppColors.color54B25AMain),
//                       weekdayStyle:
//                           TextStyle(color: AppColors.color54B25AMain)),
//                   firstDay: DateTime.utc(2010, 10, 16),
//                   lastDay: DateTime.utc(2030, 3, 14),
//                   focusedDay: focusedDay,
//                   selectedDayPredicate: (day) => isSameDay(selectedDay, day),
//                   calendarFormat: CalendarFormat.month,
//                   onDaySelected: (selecteDay, focusedDay) {
//                     if (!isSameDay(selectedDay, focusedDay)) {
//                       setState(() {
//                         selectedDay = selecteDay;
//                         focusedDay = focusedDay;
//                       });
//                       onTap(selectedDay ?? DateTime.now());
//                       Navigator.pop(context);
//                     }
//                   },
//                   onPageChanged: (focusedDay) {
//                     focusedDay = focusedDay;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 const SizedBox(
//                   height: 24,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }),
//   );
// }
