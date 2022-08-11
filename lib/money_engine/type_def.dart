import 'package:decimal/decimal.dart';

// 金币类型
typedef Dec = Decimal;

// 日期类型
typedef Date = DateTime;

extension DateExt on DateTime {
  static Date getMinDate(Date date1, Date date2) =>
      date1.isBefore(date2) ? date1 : date2;
  static Date getMaxDate(Date date1, Date date2) =>
      date1.isAfter(date2) ? date1 : date2;
}
