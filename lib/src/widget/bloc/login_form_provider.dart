import 'package:flutter/material.dart';
import 'package:simple_bloc_app_with_sqflite/src/widget/bloc/form_bloc.dart';

class LoginFormProvider extends InheritedWidget {
  final bloc = FormBloc();

  LoginFormProvider({Key? key, required Widget child,})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static FormBloc of(BuildContext context) {
    final LoginFormProvider? result = context.dependOnInheritedWidgetOfExactType<LoginFormProvider>();
    return result!.bloc;
  }
}
