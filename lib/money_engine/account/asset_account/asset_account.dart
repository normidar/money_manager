import 'package:money_manager/money_engine/account/account.dart';
import 'package:money_manager/money_engine/data_type/asset/asset.dart';
import 'package:money_manager/money_engine/type_def.dart';

abstract class AssetAccount extends Account {
  /// 获取所有资产（如果输入日期则为到某日期为止）
  Future<List<Asset>> getAllAssets({Date? until});


  // ----- 上为资产，下为资产流水

  /// 计入一条资产流水
  Future<bool> writeJournalAsset(Asset asset);

  /// 获取所有资产流水
  Future<List<Asset>> getAllJournalAssets();


}
