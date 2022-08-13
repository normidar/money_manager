import 'package:flutter/material.dart';
import 'package:money_manager/money_engine/account/journal_account/journal_account.dart';
import 'package:money_manager/money_engine/data_type/journal.dart';
import 'package:money_manager/money_engine/data_type/period.dart';

/// 带缓存试的简单流水账
abstract class SimpleJournalAccount extends JournalAccount {
  List<Journal> _journalDatas = List<Journal>.empty();

  /// 获取一段期间的流水
  @override
  Future<List<Journal>> getJournal(Period period) async {
    return _journalDatas.where((element) => period.isDateIn(element.date)).toList();
  }

  


}
