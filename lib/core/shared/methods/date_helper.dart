
import 'package:flutter/material.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

abstract class DateTimeHelper{

   static String formatDateAsStringIntoStringDayMonth( String time,
      {bool isFullMonth = false}) {
    final DateTime dataTime = DateTime.parse(time);
    final DateFormat formatter = isFullMonth
        ? DateFormat.yMMMMd()
        : DateFormat.yMMMd( );
    return formatter.format(dataTime).toString();
    /// for example convert this string date (“2024-03-15 14:30:00”) into Formatted Date: March 15, 2024
  }

   static String formatDateFromString(String date,
      {String? format, String? local}) {
    return
      DateFormat(format ?? 'dd/MM/yyyy ', local ?? 'en').format(DateTime.parse(date));
    /// for example convert this string date (“2024-03-15 14:30:00”) into Formatted Date: 2024/03/15 14:30
  }





// static   Duration convertDurationToSMH(Duration duration) {
//
//   return Duration(
//       hours: duration.inHours,
//       minutes: duration.inMinutes,
//       seconds:duration.inSeconds );
//
// }

// static   DateTime convertStringToDateTime(String dateTimeString,{String replacer='.'  }) {
//   if (dateTimeString=="null") {
//     return DateTime.now().subtract(Duration(days: 2));
//   }
//   final List<String> dateParts = dateTimeString.split(replacer);
//   final int day = int.parse(dateParts[0]);
//   final int month = int.parse(dateParts[1]);
//   final int year = int.parse(dateParts[2]);
//   return DateTime(year, month, day);
//   /// for example convert this string (“30.04.2024”) into DateTime: 2024-04-30 00:00:00.000
// }

// static String dateTimeNow({String? locale}) {
//
//   return DateFormat('dd.MM.yyyy',locale??'en').format(DateTime.now());
// }

// static bool checkDateIsTodayDate(DateTime dateToCheck) {
//   DateTime today = DateTime.now();
//
//   return (DateTime(today.year, today.month, today.day) ==
//       DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day)) ;
//   /// return true if this input (dateToCheck) is today date
// }

// static String convertTimestampToMessageDate(DateTime date) =>
//     ///Suppose you call this method with the input DateTime(2023, 6, 1, 14, 30) (which represents June 1, 2023, at 2:30 PM). It would return
// ///the formatted date string "Thu 01 Jun 2023 02:30 PM" (assuming the language/locale is set appropriately).
// DateFormat(
//   'EEE dd MMM  yyy  hh:mm a',
//
// ).format(date);
}