import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileDatabase {
  final String _rootPath;
  FileDatabase(String rootPath) : _rootPath = rootPath;

  Future<Directory> getFullPath() async {
    final documentsDirectoryPath =
        (await getApplicationDocumentsDirectory()).path;
    print(documentsDirectoryPath + '/a');
    return Directory(documentsDirectoryPath);
  }

  /// all static
  /// write line by path,line
  /// read line by path return stream
  /// read lines as list
  /// delete a line by index
}
