import 'package:money_manager/money_engine/account/account.dart';
import 'package:money_manager/money_engine/data_type/journal.dart';
import 'package:money_manager/money_engine/data_type/period.dart';
import 'package:money_manager/money_engine/type_def.dart';

/// 表示一个账户，可以是现金账户，或者是
abstract class JournalAccount extends Account {
  /// 获取一段期间的流水
  Future<List<Journal>> getJournal(Period period);

  /// 写入一条流水到账户
  Future writeJournal(Journal journal);

  /// 删除一条流水
  Future deleteJournalByID(String id);

  /// 获取从某日期开始的迭代器
  /// if isBack is true then return after date, else return before date.
  Stream<Journal> getIteratorFromDate(Period period);

  /// 获取所有流水账
  Future<List<Journal>> getAllJouranl();

  Future<int> getJouranlCount();

  @override
  Future<Dec> getAssetValue();
}
