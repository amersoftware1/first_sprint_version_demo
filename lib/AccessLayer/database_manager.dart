import 'package:sqlite3/sqlite3.dart';

class DatabaseManager {
  static final _db = sqlite3.open('DB.db');

  static void insert(int id, String name) {
    try {
      _db.execute('INSERT INTO users (id, name) VALUES (?,?)', [id, name]);
    } catch (e) {
      print("database Error ($e)");
    } finally {
      _db.dispose();
    }
  }
}
