import 'package:flutter/material.dart';
import 'users_bloc.dart';

class UsersProvider extends InheritedWidget {
  final UsersBloc usersBloc;

  UsersProvider({
    Key? key,
    required Widget child,
  })  : usersBloc = UsersBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static UsersBloc of(BuildContext context) {
    final UsersProvider? result =
        context.dependOnInheritedWidgetOfExactType<UsersProvider>();
    return result!.usersBloc;
  }
}
