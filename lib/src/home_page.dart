import 'package:flutter/material.dart';

import 'widget/bloc/login_form_provider.dart';
import 'widget/form_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zikey App Sample'),),
      body: Container(
        child: Column(
          children: [LoginFormProvider(child: FormWidget())],
        ),
      ),
    );
  }
}
