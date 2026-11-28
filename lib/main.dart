import 'package:flutter/material.dart';

import 'UI/main_page.dart';
import 'AccessLayer/database_manager.dart';

void main() {
  print("Application started");
  // DatabaseManager.insert(43, 'Hello world ');
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
}
