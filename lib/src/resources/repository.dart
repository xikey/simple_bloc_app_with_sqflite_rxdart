import 'dart:async';

import 'package:simple_bloc_app_with_sqflite/src/models/user_model.dart';
import 'package:simple_bloc_app_with_sqflite/src/resources/user_db_provider.dart';

class Repository {
  UserDbProvider userDbProvider = UserDbProvider();

  Future<List<UserModel>?> fetchItems() async {
    return userDbProvider.fetchItems();
  }

  addItem(UserModel item) {
    userDbProvider.addItem(item);
  }
}
