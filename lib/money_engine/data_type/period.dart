import 'package:money_manager/money_engine/type_def.dart';

/// 表示一段期间
abstract class Period {
  const Period();
  Date get from;
  bool isDateIn(Date date);
  bool get isAfter;
  // Period getUnion(Period other);
  Period? getIntersection(Period other);
}

extension DateExt on Date {
  static Date getMinDate(Date date1, Date date2) =>
      date1.isBefore(date2) ? date1 : date2;
  static Date getMaxDate(Date date1, Date date2) =>
      date1.isAfter(date2) ? date1 : date2;
}

/// 有开始和结束的期间
class BetweenPeriod extends Period {
  @override
  final Date from;
  final Date to;

  const BetweenPeriod({required this.from, required this.to});

  @override
  bool get isAfter => to.isAfter(from);

  @override
  bool isDateIn(Date date) =>
      (date.isAfter(from) && date.isBefore(to)) ||
      (date.isBefore(from) && date.isAfter(to));

  @override
  Period? getIntersection(Period other) {
    if (isAfter != other.isAfter) {
      // 不支持反方向
      throw Exception('unsupported difference direction A');
    }
    if (isAfter) {
      if (other.from.isBefore(to)) {
        return BetweenPeriod(
            from: DateExt.getMaxDate(from, other.from),
            to: other is BetweenPeriod ? DateExt.getMinDate(to, other.to) : to);
      }
    } else {
      if (other.from.isAfter(to)) {
        return BetweenPeriod(
            from: DateExt.getMinDate(from, other.from),
            to: other is BetweenPeriod ? DateExt.getMaxDate(to, other.to) : to);
      }
    }
    return null;
  }
}

// 只有开始和方向的无限区间
class UnlimitedPeriod extends Period {
  @override
  final Date from;
  @override
  final bool isAfter;
  const UnlimitedPeriod({required this.from, required this.isAfter});

  @override
  bool isDateIn(Date date) =>
      isAfter ? date.isAfter(from) : date.isBefore(from);

  @override
  Period? getIntersection(Period other) {
    if (other is BetweenPeriod) {
      return other.getIntersection(this);
    }
    if (other is UnlimitedPeriod) {
      if (isAfter && other.isAfter) {
        return UnlimitedPeriod(
            from: DateExt.getMaxDate(from, other.from), isAfter: true);
      } else if (!isAfter && !other.isAfter) {
        return UnlimitedPeriod(
            from: DateExt.getMinDate(from, other.from), isAfter: false);
      }
      throw Exception('unsupported difference direction B');
    }
    throw Exception('has no this class');
  }
}
