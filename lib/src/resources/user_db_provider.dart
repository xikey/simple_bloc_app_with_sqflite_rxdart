import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:simple_bloc_app_with_sqflite/src/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class UserDbProvider {

  UserDbProvider() {
    init();
  }

  late Database db;

  init() async {
    print("INIT DONE");
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, 'mydb.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDB, int version) async {
      await newDB.execute("""
          CREATE TABLE user(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT,
          password TEXT
          )
      """);
    });
  }

  Future<List<UserModel>?> fetchItems() async {
    final maps = await db.query(
      "user",
      columns: null,
    );
    if (maps.length > 0) {
      List<UserModel> list = [];
      maps.forEach((element) {
        list.add(UserModel.fromDB(element));
      });
      return list;
    } else {
      return null;
    }
  }

  addItem(UserModel item) {
    db.insert('user', item.toMap());
  }
}
