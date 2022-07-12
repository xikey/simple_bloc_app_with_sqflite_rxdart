import 'package:flutter/material.dart';
import 'package:simple_bloc_app_with_sqflite/src/widget/bloc/users_provider.dart';

import 'widget/bloc/login_form_provider.dart';
import 'widget/form_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zikey App Sample'),
      ),
      body: Container(
        child: Column(
          children: [
            UsersProvider(child: LoginFormProvider(child: FormWidget()))
          ],
        ),
      ),
    );
  }
}
