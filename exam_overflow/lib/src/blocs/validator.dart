import 'dart:async';


mixin Validator {
final validateName = StreamTransformer<String,String>.fromHandlers(
    handleData: ( name, sink) {
      if (name.isNotEmpty ) {
        sink.add(name);
      }
    }
  );

  final validateEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: ( email, sink) {
      if (email.contains('@') && email.length> 9) {
        sink.add(email);
      }
      else{
        sink.addError('Enter a valid email');
      }
    }
  );

  final validatePassword = StreamTransformer<String,String>.fromHandlers(
    handleData:(password, sink) {
      if(password.length > 3){
        sink.add(password);
      }
      else{
        sink.addError('Passwod must be atleast 4 characters');
      }
    } );
}