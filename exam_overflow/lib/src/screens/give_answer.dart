import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Answer extends StatefulWidget {
  final Map<String, dynamic> args;
  const Answer({super.key, required this.args});
  @override
  _Answer createState() => _Answer();
}

class _Answer extends State<Answer> {
  final answer_controller = TextEditingController();

  Map<String, dynamic> user_info = {};
  Map<String, dynamic> info = {};
  String user_id = "-1";
  List<dynamic> answers = [];
  Future<List<dynamic>> answerQuestion() async {
    String answer = answer_controller.text;

    return [];
    // simple validation
  }

  Future<Map<String, dynamic>> loadUserInfo() async {
    print(info);
    try {
      final result =
          await http.post(Uri.parse(Database.log_in), body: {"id": info['id']});

      if (result.statusCode == 200) {
        print(result.body);
        Map<String, dynamic> value = jsonDecode(result.body);
        if (value.containsKey('data')) {
          user_info.addAll(value['data']);
          return value['data'];
        }

        return {"error": Database.errors_and_message[value['error'][0]]};
      } else {
        return {"error": "Server is not connected"};
      }
    } catch (e) {
      return {"error": "Connection error!"};
    }
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
    info = widget.args;
    setVariables();
    if (info.isNotEmpty) {
      loadUserInfo();
    }
  }

  Future<List<dynamic>> loadAnswers() async {
    try {
      final request = await http.post(Uri.parse(Database.load_answers),
          body: {"question_id": info['id']});
      if (request.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(request.body);
        if (result.containsKey('data')) {
          answers.addAll(result["data"]);
          return answers;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 193, 72, 95),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                    future: loadUserInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        if (snapshot.data!.containsKey("error")) {
                          Fluttertoast.showToast(msg: snapshot.data!["error"]);
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Card(
                            elevation: 8.0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    snapshot.data!['student_name'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Subject",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    "${info['subject']} ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Topic",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${info['topic']} ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Question",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${info['question']} ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 15.0),
                                  Text(
                                    "Email: ${snapshot.data!['student_email']}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  Input(
                      label: "Give answer",
                      controller: answer_controller,
                      maxLine: 3),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      backgroundColor: Color.fromARGB(255, 85, 136, 212),
                    ),
                    onPressed: () {},
                    child: Text(
                      "answer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // this it to extract existing answers

                  Expanded(
                    child: FutureBuilder<List<dynamic>>(
                        future: loadAnswers(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                              'Error ocured ${snapshot.error}',
                              style: TextStyle(color: Colors.red),
                            ));
                          } else {
                            return ListView.builder(
                              itemCount: answers.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                      answers[index]['student_name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "Answer\n ${answers[index]["answer"]}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
