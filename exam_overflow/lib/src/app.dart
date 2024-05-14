import 'package:flutter/material.dart';
import 'screens/loginApp.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
       child: MaterialApp(  
      title: 'Bloc login App',
      home:Scaffold(
        body: LoginApp(),
       )
    ),
    );
  }
}