import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Question extends StatefulWidget {
  const Question({super.key});
  @override
  _Question createState() => _Question();
}

class _Question extends State<Question> {
  final subject_control = TextEditingController();
  final topic_control = TextEditingController();
  final question_control = TextEditingController();
  String user_id = "-1";
  Future<List<dynamic>> saveQuestion() async {
    String subject = subject_control.text;
    String topic = topic_control.text;
    String question = question_control.text;

    // simple validation
    if (question.isEmpty || subject.isEmpty || topic.isEmpty) {
      return [false, "Field Cannot be empty"];
    }
    if (question.length < 5 || topic.length < 5 || subject.length < 5) {
      return [false, "Check your input"];
    }
    Set s = {"biology", "physics", "mathematics", "chemistry"};
    if (!s.contains(subject.toLowerCase())) {
      return [false, "Check if your subject is valid"];
    }
    if (user_id != "-1") {
      final submitQuestion = await http
          .post(Uri.parse(Database.upload_question), body: {
        "id": user_id,
        "topic": topic,
        "subject": subject,
        "question": question
      });
      if (submitQuestion.statusCode == 200) {
        print(submitQuestion.body);
        Map<String, dynamic> value = jsonDecode(submitQuestion.body);
        if (value.containsKey('success')) {
          return [true, ""];
        } else {
          return [false, Database.errors_and_message[value["error"][0]]];
        }
      } else {
        return [false, Database.errors_and_message[102]];
      }
    }
    return [false, "something went wrong"];
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
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Input(
                  label: "Topic",
                  controller: topic_control,
                  maxLine: 1,
                ),
                Input(
                  label: "Subject",
                  controller: subject_control,
                  maxLine: 1,
                ),
                Input(
                    label: "Enter Your Questoin",
                    controller: question_control,
                    maxLine: 8),
                ElevatedButton(
                  onPressed: () async {
                    final resp = await saveQuestion();
                    if (resp[0]) {
                      Fluttertoast.showToast(msg: "Success");
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(msg: resp[1]);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(86, 132, 186, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
