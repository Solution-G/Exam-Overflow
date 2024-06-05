import 'package:exam_overflow/src/blocs/provider.dart';
import 'package:exam_overflow/src/screens/ExamPage.dart';
import 'package:exam_overflow/src/screens/landing.dart';
import 'package:exam_overflow/src/screens/material.dart';
import 'package:exam_overflow/src/screens/signInApp.dart';
import 'package:flutter/material.dart';
import '/src/screens/loginApp.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      home: SignUp(),
      routes: {
        '/log_in': (context) => LogIn(),
        '/sign_up': (context) => SignUp(),
        '/home': (context) => Home(),
        '/exam': (context) => Exam(),
        '/material': (context) => MyMaterial(),
      },
    ));
  }
}
