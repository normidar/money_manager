import 'package:flutter/material.dart';
import 'package:money_manager/money_engine/account/journal_account/journal_account.dart';
import 'package:money_manager/money_engine/data_type/jouranl/journal.dart';
import 'package:money_manager/money_engine/data_type/period.dart';
import 'package:money_manager/money_engine/type_def.dart';

/// 带缓存试的简单流水账
abstract class SimpleJournalAccount extends JournalAccount {
  List<Journal>? _journalDatas;
  Future<List<Journal>> getJournalDatas() async {
    _journalDatas ??= await getAllJouranl();
    return _journalDatas!;
  }

  /// 获取一段期间的流水
  @override
  Future<List<Journal>> getJournal(Period period) async {
    return (await getJournalDatas())
        .where((element) => period.isDateIn(element.date))
        .toList();
  }

  /// 写入一条流水到账户,不需重写
  @override
  Future<bool> writeJournal(Journal journal) async {
    (await getJournalDatas()).add(journal);
    return await simpleWiriteJournal(journal);
  }

  /// 重写这个并写数据入库
  @protected
  Future<bool> simpleWiriteJournal(Journal journal);

  /// 删除一条流水, true成功，false失败
  @override
  Future<bool> deleteJournalByID(String id) async {
    (await getJournalDatas()).removeWhere((element) => element.id == id);
    return await simpleDeleteJournalByID(id);
  }

  /// 重写这个并从数据库中删除
  @protected
  Future<bool> simpleDeleteJournalByID(String id);

  /// 获取从某段期间的流水的迭代器
  /// if isBack is true then return after date, else return before date.
  @override
  Stream<Journal> getIteratorFromDate(Period period) async* {
    final result = (await getJournalDatas())
        .where((element) => period.isDateIn(element.date));
    for (var e in result) {
      yield e;
    }
  }

  /// 获取流水账的数量
  @override
  Future<int> getJouranlCount() async {
    return (await getJournalDatas()).length;
  }

  /// 获取账户价值
  @override
  Future<Dec> getAssetValue() async {
    Dec result = Dec.zero;
    for (var e in await getJournalDatas()) {
      if (e.isExpense) {
        result -= e.count;
      } else {
        result += e.count;
      }
    }
    return result;
  }
}
