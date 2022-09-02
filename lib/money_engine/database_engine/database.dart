import 'package:money_manager/money_engine/database_engine/data.dart';

abstract class Database {
  // crud: create read update delete

  /// create and return id, if failed return null
  Future<int?> create(Data data);

  /// read data by id
  Future<Data?> read(int id);

  /// get all data count in database
  Future<int> getCount();

  /// update data by id
  Future<bool> update(int id, Data data);

  /// delete data and return deleted data
  Future<Data?> delete(int id);
}
