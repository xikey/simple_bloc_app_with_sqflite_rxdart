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

  Database? db;

  init() async {
    print("INIT DONE");
    if (db != null) {
      return;
    }

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print('DIR= ' + documentsDirectory.toString());
    final String path = join(documentsDirectory.path, 'mydb.db');
    print(path);
    db = await openDatabase(path, version: 2,
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
    if (db == null) await init();

    final maps = await db!.query(
      "user",
      columns: null,
    );
    if (maps.length > 0) {
      print('USRS IS NOT EMPTY');
      List<UserModel> list = [];
      maps.forEach((element) {
        list.add(UserModel.fromDB(element));
      });
      print(list.length);
      print(list);
      return list;
    } else {
      print('USRS IS EMPTY');
      return null;
    }
  }

  addItem(UserModel item) {
    if (db == null)
      init();
    db!.insert('user', item.toMap());
  }
}
