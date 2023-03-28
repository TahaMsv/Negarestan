import 'package:intl/intl.dart';
class DateTimeUtilities {
  DateTimeUtilities._();
  static String formatDate(DateTime myDateTime) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(myDateTime);
  }

  static DateTime formatString(String dateString) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.parse(dateString);
  }

  static DateTime dateFromString(String dateString) {
    return DateTime.parse(dateString);
  }

  static String stringFromDate(DateTime dateTime) {
    return dateTime.toString();
  }

}
