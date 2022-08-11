import 'package:money_manager/money_engine/data_type/journal.dart';
import 'package:money_manager/money_engine/data_type/period.dart';

/// 表示一个账户，可以是现金账户，或者是
abstract class Account {
  /// 获取一段期间的流水
  Future<List<Journal>> getJournal(Period period);

  /// 写入一条流水到账户
  Future writeJournal(Journal journal);

  /// 获取从某日期开始的迭代器
  /// if isBack is true then return after date, else return before date.
  Stream<Journal> getIteratorFromDate(Period period);

  
}
