import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:simple_bloc_app_with_sqflite/src/models/user_model.dart';
import 'package:simple_bloc_app_with_sqflite/src/resources/repository.dart';
import 'package:simple_bloc_app_with_sqflite/src/widget/bloc/validators.dart';

class FormBloc with Validator {
  //why we dont use StreamController?!
  //cuz: the stream controller cannot hold the last value. in fact when the last value emitted. the stream is empty
  // BehaviorSubject can do it so well :)/ it can holds the last emitted value
  //  final _email = StreamController<String>.broadcast();
  //  //  final _password = StreamController<String>.broadcast();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submit => Rx.combineLatest2(email, password, (a, b) => true);

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

 Map<String, String> submitPressed()   {
    final validEmail = _email.value;
    final validPassword = _password.value;

    return   <String, String>{'email': validEmail, 'password': validPassword};
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
