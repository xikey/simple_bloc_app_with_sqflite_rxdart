import 'package:rxdart/rxdart.dart';
import 'package:simple_bloc_app_with_sqflite/src/models/user_model.dart';
import 'package:simple_bloc_app_with_sqflite/src/resources/repository.dart';

class UsersBloc {
  final Repository repo = Repository();
  final _users = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get users => _users.stream;

  fetchUsers() async {
    final List<UserModel>? list = await repo.fetchItems();
    if (list != null) _users.sink.add(list);
  }

  addUser(UserModel item) {
    repo.addItem(item);
  }

  dispose() {
    _users.close();
  }
}
