import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'bloc.dart';

///Inherited widget is a special kind of widget that difines
///a context in whick its child widgets can acces shared data.
class Provider extends InheritedWidget {
  //to provide an instance of Bloc to its decendants.
  final bloc = Bloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override

  ///called and rebuilts all widgets that depends on inherited widget
  /// whenever  the provider widget is rebuilt.
  bool updateShouldNotify(_) => true;
//this method allows widgets to access the Bloc instance form the provider.
  static Bloc of(context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }
}
