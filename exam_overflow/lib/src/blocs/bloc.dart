import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

///Blooc class uses StreamController to manage the state of the email and
///password fields.
class Bloc extends Object with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();

  submit() {
    String name = _name.value;
    String mail = _email.value;
    String pss = _password.value;

  }

  Stream<String> get name => _name.stream.transform(validateName);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) {
        return true;
      });

  Function(String) get changeName => _name.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
    _name.close();
  }
}
