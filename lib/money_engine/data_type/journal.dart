// 表示一条流水的类型
import 'package:money_manager/money_engine/data_type/journal_type.dart';
import 'package:money_manager/money_engine/type_def.dart';

class Journal {
  final Date date;
  final Dec count;
  // 是否支出
  final bool isExpense;
  final JournalType journalType;

  Journal({
    required this.date,
    required this.count,
    required this.isExpense,
    required this.journalType,
  });
}
