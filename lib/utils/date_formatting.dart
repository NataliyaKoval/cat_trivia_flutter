import 'dart:io';
import 'package:intl/intl.dart';

class DateFormatting {
  static String formatDateString(String date) {
    DateTime parsedDate = DateTime.parse(date);
    DateFormat format = DateFormat.yMMMd(Platform.localeName);
    String dateString = format.format(parsedDate).toString();
    return dateString;
  }
}
