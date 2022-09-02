import 'dart:io';

// TODO: rmove abstract and write body
abstract class FileController {
  // FileController(File file);
  Future addLineToEnd(String string);
  Future addLine(int index, String string);
  Stream readLines();
  Future deleteLine(int index);
}
