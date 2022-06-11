import 'package:intl/intl.dart';

class DateTimeHelper {
  ///[DateTime] Date Time taken as argument
  ///[String] returns [12:20 AM] format if the sent [DateTime] is
  ///Today date or else [2020-JAN-21] format is sent as return type.
  static String getBestDateTime(DateTime dateTime) {
    DateTime localDate = dateTime.toLocal();
    if (calculateDifference(localDate) == 0) {
      return DateFormat('kk:mm aa').format(localDate);
    }
    return DateFormat('yyyy-MMM-dd').format(localDate);
  }

  ///[DateTime] Date Time taken as argument
  ///[int] returns 0 if the current day and day of [DateTime]
  ///is equal
  static int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
