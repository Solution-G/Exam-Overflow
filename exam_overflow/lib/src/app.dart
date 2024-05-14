import 'package:flutter/material.dart';
import 'screens/loginApp.dart';
import 'blocs/provider.dart';
import 'screens/signInApp.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
       child: MaterialApp(
        theme: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
  ),
      
      title: 'ExamOverFlow',
     
      home:Scaffold(
        body: LoginApp(),
       ),
    
        routes: {
         '/alternativeSignIn': (context) => AlternativeSignIn(),
         '/loginApp':(context) => LoginApp(),
       }
    ),
    );
  }
}