import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('EEE d MMMM yyyy - hh:mm a').format(date);
}