import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Answer extends StatefulWidget {
  const Answer({super.key});
  @override
  _Answer createState() => _Answer();
}

class _Answer extends State<Answer> {
  final subject_control = TextEditingController();
  final topic_control = TextEditingController();
  final question_control = TextEditingController();
  Map<String, dynamic> info = {};
  bool _isInitialized = false;
  String user_id = "-1";
  Future<List<dynamic>> answerQuestion() async {
    String subject = subject_control.text;
    String topic = topic_control.text;
    String question = question_control.text;
    return [];
    // simple validation
  }

  Future<void> setVariables() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? getVal = pref.getString('id');

    if (getVal == null || getVal.isEmpty) {
      return;
    }
    user_id = getVal;
  }

  @override
  void initState() {
    super.initState();

    setVariables();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      info = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      setVariables();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(info);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 155, 164, 255),
          title: const Text(
            "Exam Overflow",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_2.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                child: ListView(
              children: [ListTile()],
            ))),
      ),
    );
  }
}
