import 'package:money_manager/money_engine/type_def.dart';

abstract class Account {
  /// 获取账户价值
  Future<Dec> getAssetValue();
}
