import 'package:money_manager/money_engine/type_def.dart';

/// 商店，用于获取资产的价格
abstract class Store {
  /// 当找不到时将会返回null
  Future<Dec?> getPriceByID(String id);
}
