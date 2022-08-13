import 'package:money_manager/money_engine/account/account.dart';
import 'package:money_manager/money_engine/data_type/asset/asset.dart';

abstract class AssetAccount extends Account {
  Future<List<Asset>> getAllAssets();
}
