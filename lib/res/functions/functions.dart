import 'package:intl/intl.dart';

String getNextMonday() {
  DateTime now = DateTime.now();
  int daysUntilNextMonday = DateTime.monday - now.weekday;
  if (daysUntilNextMonday <= 0) {
    daysUntilNextMonday += 7;
  }
  DateTime nextMonday = now.add(Duration(days: daysUntilNextMonday));

  final dateFormat = DateFormat('d, MMM y');
  final formattedDate = dateFormat.format(nextMonday);
  return formattedDate;
}

String getNextTuesday() {
  DateTime now = DateTime.now();
  int daysUntilNextTuesday = DateTime.tuesday - now.weekday;
  if (daysUntilNextTuesday <= 0) {
    daysUntilNextTuesday += 7;
  }
  DateTime nextTuesday = now.add(Duration(days: daysUntilNextTuesday));

  final dateFormat = DateFormat('d, MMM y');
  final formattedDate = dateFormat.format(nextTuesday);
  return formattedDate;
}

String getTodayDate() {
  DateTime today = DateTime.now();

  final dateFormat = DateFormat('d, MMM y');
  final formattedDate = dateFormat.format(today);
  return formattedDate;
}

String getOneWeekFromNow() {
  DateTime now = DateTime.now();
  DateTime oneWeekFromNow = now.add(Duration(days: 7));

  final dateFormat = DateFormat('d, MMM y');
  final formattedDate = dateFormat.format(oneWeekFromNow);
  return formattedDate;
}

String convertDateFormat(String dateStr) {
  // Remove the brackets and milliseconds from the date string
  String cleanedDateStr =
      dateStr.replaceAll('[', '').replaceAll(']', '').split('.')[0];

  // Split the remaining string by the space character
  List<String> dateParts = cleanedDateStr.split(' ');

  // Extract the date and time parts
  String datePart = dateParts[0];
  String timePart = dateParts[1];

  // Split the date part by the hyphen character
  List<String> dateComponents = datePart.split('-');

  // Extract the year, month, and day components
  int year = int.parse(dateComponents[0]);
  int month = int.parse(dateComponents[1]);
  int day = int.parse(dateComponents[2]);

  // Format the date using the desired format
  final dateFormat = DateFormat('d, MMM y');
  final formattedDate = dateFormat.format(DateTime(year, month, day));

  return formattedDate;
}
