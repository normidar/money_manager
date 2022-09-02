import 'package:money_manager/money_engine/database_engine/data.dart';
import 'package:money_manager/money_engine/database_engine/database.dart';

class MemoryDatabase extends Database {
  int _index = 1;
  final Map<int, Data> _memoryDatas = {};

  @override
  Future<int?> create(Data data) async {
    while (_memoryDatas.containsKey(_index)) {
      _index++;
    }
    _memoryDatas[_index] = data;
    return _index++;
  }

  @override
  Future<Data?> delete(int id) async {
    if (_memoryDatas.containsKey(id)) {
      return _memoryDatas.remove(id);
    } else {
      return null;
    }
  }

  @override
  Future<int> getCount() async {
    return _memoryDatas.length;
  }

  @override
  Future<Data?> read(int id) async {
    if (_memoryDatas.containsKey(id)) {
      return _memoryDatas[id];
    }
    return null;
  }

  @override
  Future<bool> update(int id, Data data) async {
    if (_memoryDatas.containsKey(id)) {
      _memoryDatas[id] = data;
      return true;
    }
    return false;
  }
}
