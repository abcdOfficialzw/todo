import 'package:intl/intl.dart';

class AppManager {
  String formatDateString(String dateString) {
    DateTime inputDate = DateTime.parse(dateString);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    DateTime inputDateWithoutTime = DateTime(
      inputDate.year,
      inputDate.month,
      inputDate.day,
    );

    if (inputDateWithoutTime == today) {
      return "Today • ${DateFormat("h:mm a").format(inputDate)}";
    } else if (inputDateWithoutTime == yesterday) {
      return "Yesterday • ${DateFormat("h:mm a").format(inputDate)}";
    } else {
      return DateFormat("MMMM d").format(inputDate);
    }
  }
}
