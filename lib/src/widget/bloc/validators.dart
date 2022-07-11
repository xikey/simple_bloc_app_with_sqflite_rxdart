import 'dart:async';

class Validator {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        if (email.contains('@')) {
          sink.add(email);
        } else {
          sink.addError('Enter a valid email');
        }
      }
  );


  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink) {
        if (pass.length>4) {
          sink.add(pass);
        } else {
          sink.addError('at least 5 char');
        }
      }
  );

}