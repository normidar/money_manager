import 'package:money_manager/money_engine/type_def.dart';

/// 商店，用于获取资产的价格
class MapStore {
  final Map<String, Dec> _map;
  MapStore({required Map<String, Dec> dataMap}) : _map = dataMap;

  Future updatePrice(String id, Dec price) async {
    _map[id] = price;
  }

  /// 当找不到时将会返回null
  Future<Dec?> getPriceByID(String id) async {
    return _map[id];
  }
}
