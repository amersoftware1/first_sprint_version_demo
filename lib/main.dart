import 'package:flutter/material.dart';

import 'pages/main_page.dart';
import 'AccessLayer/database_manager.dart';

void main() {
  print("hello world");
  DatabaseManager.insert(43, 'Hello world ');
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
}
