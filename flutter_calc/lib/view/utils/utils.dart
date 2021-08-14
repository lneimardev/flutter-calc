import 'package:intl/intl.dart';

String formtDateToStr(DateTime d, String format) {
  if (d == null) return null;

  return DateFormat(format, 'pt_BR').format(d);
}
