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
      
      title: 'Exam OverFlow',
     
      home: Scaffold(
  appBar: PreferredSize(
    preferredSize: Size.fromHeight(10.0), // Change this value to control the height
    child: AppBar(
      title: Text(
        'WELCOME TO',
        style: TextStyle(
          fontSize: 15.0,fontWeight:FontWeight.bold ,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[900], 
      centerTitle: true, 
    ),
  ),
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