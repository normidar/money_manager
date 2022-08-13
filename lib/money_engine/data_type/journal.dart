// 表示一条流水的类型
import 'package:money_manager/money_engine/data_type/journal_type.dart';
import 'package:money_manager/money_engine/type_def.dart';

class Journal {
  /// 如果无id将难以删除
  String id;
  final Date date;

  /// 流水额 必须正数
  final Dec count;

  /// 是否支出
  final bool isExpense;
  final JournalType journalType;

  Journal({
    this.id = '',
    required this.date,
    required this.count,
    required this.isExpense,
    required this.journalType,
  });

  @override
  bool operator ==(Object other) =>
      other is Journal &&
      date == other.date &&
      count == other.count &&
      isExpense == other.isExpense &&
      journalType == other.journalType;

  @override
  int get hashCode => Object.hash(date, count, isExpense, journalType);
}
