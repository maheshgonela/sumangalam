import 'package:intl/intl.dart';

/// Shortcut for DateFormatUtil [DFU]
typedef DFU = DateFormatUtil;

abstract class _DateTimeFormats {
  static final dayName = DateFormat('EEE');
  static final dayNameFull = DateFormat('EEEE');
  static final ddMMyyyy = DateFormat('dd-MMM-yyyy');
  static final ddMMMyyyy = DateFormat('dd/MM/yyyy');
  static final friendlyFormat = DateFormat('dd-MM-yyyy');
  static final yyyyMMdd = DateFormat('yyyy-MM-dd');

  static final hhMMss = DateFormat('HH:mm:ss');
}
abstract class DateFormatUtil {
  static DateTime now() => DateTime.now();

  static DateTime toDateTime(String date, [String format = 'dd/MM/yyyy']) => DateFormat(format).parse(date);

  static String getDayName(DateTime dateTime) => _DateTimeFormats.dayName.format(dateTime);

  static String getDayNameFully(DateTime dateTime) => _DateTimeFormats.dayNameFull.format(dateTime);
  static String ddMMyyyy(DateTime dateTime) => _DateTimeFormats.ddMMyyyy.format(dateTime);
  static String ddMMMyyyy(DateTime dateTime) => _DateTimeFormats.ddMMMyyyy.format(dateTime);
  static String yyyyMMdd(DateTime dateTime) => _DateTimeFormats.yyyyMMdd.format(dateTime);
  static String hhMMss(DateTime dateTime) => _DateTimeFormats.hhMMss.format(dateTime);
  static String friendlyFormat(DateTime dateTime) => _DateTimeFormats.friendlyFormat.format(dateTime);
  static String fullDateFomrat() {
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(DFU.now());
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String toTime(String dateTime) {
    try {      
      final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);
      return DateFormat('HH:mm:ss').format(dateFormat);
    } catch (_) {
      return dateTime;
    }
  }
  static String toDate(String dateTime){
    try {
      final date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);
      print('date $date');
      return DateFormat('dd-MM-yyyy').format(date);
    } catch (e) {
      return dateTime;
      
    }
  }
   
 
}
