import 'package:flutter/material.dart';
import 'package:simple_bloc_app_with_sqflite/src/models/user_model.dart';
import 'package:simple_bloc_app_with_sqflite/src/widget/bloc/login_form_provider.dart';
import 'package:simple_bloc_app_with_sqflite/src/widget/bloc/users_bloc.dart';
import 'package:simple_bloc_app_with_sqflite/src/widget/bloc/users_provider.dart';
import '../widget/bloc/form_bloc.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formBloc = LoginFormProvider.of(context);
    final usersBloc = UsersProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          emailField(formBloc),
          const SizedBox(
            height: 20,
          ),
          passwordField(formBloc),
          const SizedBox(
            height: 20,
          ),
          submit(formBloc,usersBloc),
        ],
      ),
    );
  }

  Widget emailField(FormBloc formBloc) {
    return StreamBuilder(
        stream: formBloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: formBloc.changeEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Adress',
              hintText: 'you@example.com',
              errorText:
                  snapshot.error == null ? null : snapshot.error.toString(),
            ),
          );
        });
  }

  Widget passwordField(FormBloc formBloc) {
    return StreamBuilder(
        stream: formBloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: formBloc.changePassword,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Password',
              errorText:
                  snapshot.error == null ? null : snapshot.error.toString(),
            ),
          );
        });
  }

  Widget submit(FormBloc formBloc, UsersBloc usersBloc) {
    return StreamBuilder(
        stream: formBloc.submit,
        builder: (context, snapshot) {
          return RaisedButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.amber,
            onPressed: !snapshot.hasData
                ? null
                : () {
                    final Map<String, String> result = formBloc.submitPressed();
                    print(result['email'].toString());
                    usersBloc.addUser(
                        UserModel(result['email'].toString(), result['password'].toString()));
                    usersBloc.fetchUsers();
                  },
          );
        });
  }
}
