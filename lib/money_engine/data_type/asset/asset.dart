import 'package:money_manager/money_engine/data_type/asset/asset_index.dart';
import 'package:money_manager/money_engine/type_def.dart';

/// 一种的资产的所持
class Asset {
  final AssetIndex asset;
  Dec _value;
  Dec get value => _value;
  set value(Dec v) {
    _value = v;
    dataUpdate();
  }

  Dec _count;
  Dec get count => _count;
  set count(Dec v) {
    _count = v;
    dataUpdate();
  }

  Asset({required this.asset, Dec? value, Dec? count})
      : _value = value ?? Dec.zero,
        _count = count ?? Dec.zero;

  void dataUpdate() {}
}
