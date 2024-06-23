import 'dart:collection';
import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Solution extends StatefulWidget {
  Solution({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Solution();
  }
}

// ignore: must_be_immutable
class _Solution extends State<Solution> {
  List<dynamic> questions = [];
  String? user_id = "-1";

  @override
  void initState() {
    super.initState();
    loadId();
  }

  Future<void> loadId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    user_id = pref.getString("id");
    if (user_id != "-1") {
      loadQuestions();
    }
  }

  Future<List<dynamic>> loadQuestions() async {
    try {
      var result = await http.post(Uri.parse(Database.load_question),
          body: {"id": user_id, "equal": "yes"});
      if (result.statusCode == 200) {
        print("--------------------val--------------------");
        print(result.body);
        print(user_id);
        print("---------------------end---------------------");
        List<dynamic> value = jsonDecode(result.body);
        questions = value;
        return questions;
      } else {}
    } catch (e) {
      return [];
    }
    return [];
  }

  final _scrollKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 193, 72, 95)),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
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
            // This will set the scaffhold background transparent so that the background setted by the container will be visible
            backgroundColor: Colors.transparent,
            // to scroll for available exams Listed
            body: Column(
              children: [
                TopTitle(title: "Qustions"),
                Expanded(
                  child: FutureBuilder<List<dynamic>>(
                      future: loadQuestions(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.refresh),
                                ),
                                Text("Refresh")
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                              key: _scrollKey,
                              itemCount: questions.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: ListTile(
                                        leading: Image(
                                            image: AssetImage(
                                                'assets/question.png')),
                                        title: Text(
                                          questions[index]['topic'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 193, 72, 95)),
                                        ),
                                        subtitle:
                                            Text(questions[index]['question']),
                                        trailing: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            backgroundColor: Color.fromARGB(
                                                255, 85, 136, 212),
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/see_answer',
                                                arguments: questions[index]);
                                          },
                                          child: Text(
                                            "See",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                  ),
                                );
                              });
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
