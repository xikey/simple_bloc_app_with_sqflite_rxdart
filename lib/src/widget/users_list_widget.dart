import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'bloc/users_provider.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = UsersProvider.of(context);
bloc.fetchUsers();
    return StreamBuilder(
      stream: bloc.users,
      builder: (ctx, AsyncSnapshot<List<UserModel>> snapshot) {
        print("LOAD NEW WIDGET ");
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: const Text('there is no data'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (itemContext, index) {
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: ListTile(
                  title: Text(snapshot.data![index].email),
                  subtitle: Text(snapshot.data![index].password),
                  leading: const Icon(Icons.key),
                ),
              );
            },
          );
        }
      },
    );
  }
}
