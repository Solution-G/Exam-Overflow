import 'dart:async';
import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Exam extends StatefulWidget {
  Exam({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyExam();
  }
}

class MyExam extends State<Exam> with AutomaticKeepAliveClientMixin<Exam> {
  List<dynamic> exams = [];
  bool display = false;
  Map<int, String> checked = {};
  int timer = 0;
  Timer? overTime;
  Future<List<dynamic>> load_exams() async {
    try {
      var result =
          await http.post(Uri.parse(Database.load_exam), body: {"grade": "12"});
      if (result.statusCode == 200) {
        print(result.body);
        List<dynamic> view = jsonDecode(result.body);
        view.shuffle();
        for (int i = 0; i < 30; i++) {
          exams.add(view[i]);
        }
        return exams;
      } else {}
    } catch (e) {
      return [];
    }
    return [];
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            // This will set the scaffhold background transparent so that the background setted by the container will be visible
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Exam', style: TextStyle(color: Colors.white)),
              backgroundColor: const Color.fromARGB(255, 155, 164, 255),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStateColor.transparent,
                      elevation: WidgetStateProperty.all(0)),
                  child: Icon(Icons.close),
                )
              ],
              leading: Center(
                  child: Text(
                "00:00",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              shadowColor: Colors.black,
            ),

            // to scroll for available exams Listed
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FutureBuilder<List<dynamic>>(
                    future: load_exams(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                          itemCount: exams.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    title: Text(
                                        "${index + 1} ${exams[index]['question']}"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (String choise in exams[index]
                                                ["choise"]
                                            .split('##'))
                                          RadioListTile<String>(
                                            value: choise,
                                            title: Text(choise),
                                            groupValue: checked[index] ?? "",
                                            onChanged: (value) {
                                              setState(() {
                                                checked[index] = value!;
                                              });
                                            },
                                          ),
                                      ],
                                    ),
                                    trailing: Text(
                                      exams[index]['difficulty'],
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      int answer = 0;
                      for (int i = 0; i < 30; i++) {
                        List choise = exams[i]['choises'].split('##');
                        if (choise.indexOf(checked[i]) ==
                            exams[i]['answer'].codeUnitAt(0) -
                                "A".codeUnitAt(0)) {
                          answer++;
                        }
                      }
                      Fluttertoast.showToast(
                          msg: "You have answered $answer questions");
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue)),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
