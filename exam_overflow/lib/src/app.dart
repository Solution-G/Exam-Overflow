import 'package:exam_overflow/src/blocs/provider.dart';
import 'package:exam_overflow/src/screens/ExamPage.dart';
import 'package:exam_overflow/src/screens/Question.dart';
import 'package:exam_overflow/src/screens/See_answers.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:exam_overflow/src/screens/give_answer.dart';
import 'package:exam_overflow/src/screens/give_help.dart';
import 'package:exam_overflow/src/screens/landing.dart';
import 'package:exam_overflow/src/screens/material.dart';
import 'package:exam_overflow/src/screens/quotes.dart';
import 'package:exam_overflow/src/screens/signInApp.dart';
import 'package:exam_overflow/src/screens/solution.dart';
import 'package:flutter/material.dart';
import '/src/screens/loginApp.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'My App',
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => LogIn());
            case '/log_in':
              return MaterialPageRoute(builder: (context) => LogIn());
            case '/sign_up':
              return MaterialPageRoute(builder: (context) => SignUp());
            case '/home':
              return MaterialPageRoute(builder: (context) => Home());
            case '/exam':
              return MaterialPageRoute(builder: (context) => Exam());
            case '/material':
              return MaterialPageRoute(builder: (context) => MyMaterial());
            case '/question':
              return MaterialPageRoute(builder: (context) => Question());
            case '/help':
              return MaterialPageRoute(builder: (context) => Help());
            case '/solution':
              return MaterialPageRoute(builder: (context) => Solution());
            case '/give_answer':
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (context) => Answer(args: args));
            case '/see_answer':
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (context) => SeeAnswer(args: args));
            case '/quotes':
              return MaterialPageRoute(builder: (context) => QuotePage());
            default:
              return null;
          }
        },
      ),
    );
  }
}
