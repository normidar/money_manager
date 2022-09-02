import 'package:flutter/material.dart';
import 'package:money_manager/money_engine/database_engine/file/file_database.dart';

void main() {
  runApp(const MyApp());
  Future.delayed(Duration(seconds: 2)).then((value) {
    FileDatabase('/a').getFullPath().then((value) => print(value));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
