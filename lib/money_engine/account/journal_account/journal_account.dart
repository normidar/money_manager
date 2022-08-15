import 'package:money_manager/money_engine/account/account.dart';
import 'package:money_manager/money_engine/data_type/jouranl/journal.dart';
import 'package:money_manager/money_engine/data_type/period.dart';

/// 表示一个账户，可以是现金账户，或者是
abstract class JournalAccount extends Account {
  /// 获取一段期间的流水
  Future<List<Journal>> getJournal(Period period);

  /// 写入一条流水到账户, true成功，false失败
  Future<bool> writeJournal(Journal journal);

  /// 删除一条流水, true成功，false失败
  Future<bool> deleteJournalByID(String id);

  /// 获取从某段期间的流水的迭代器
  /// if isBack is true then return after date, else return before date.
  Stream<Journal> getIteratorFromDate(Period period);

  /// 获取所有流水账
  Future<List<Journal>> getAllJouranl();

  /// 获取流水账的数量
  Future<int> getJouranlCount();
}
