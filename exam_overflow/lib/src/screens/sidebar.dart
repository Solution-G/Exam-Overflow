import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Sidebar extends StatefulWidget {
  final BuildContext home_context;
  Sidebar({super.key, required this.home_context});
  @override
  _Sidebar createState() => _Sidebar();
}

class _Sidebar extends State<Sidebar> {
  BuildContext? home_context;
  String name = "User";
  String grade = "11";
  String email = "none";
  String password = "none";

  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  Future<void> clearSharedPref(BuildContext context) async {
    SharedPreferences pp = await pref;
    pp.remove(Constant.USER_EMAIL_KEY);
    pp.remove(Constant.USER_PASSWORD_KEY);
    Navigator.pop(home_context!);
  }

  Future<List<String>> getNamesAndOther() async {
    final res = await setVariables();
    if (!res) {
      return [name, grade];
    }
    try {
      final result = await http.post(Uri.parse(Database.log_in),
          body: {"student_email": email, "student_password": password});

      if (result.statusCode == 200) {
        print(result.body);
        Map<String, dynamic> value = jsonDecode(result.body);
        if (value.containsKey("data")) {
          name = value["data"]['student_name'];
          grade = value["data"]["student_grade"];
          return [name, grade];
        }
      }
    } catch (e) {
      print("failed");
    }
    return [name, grade];
  }

  Future<bool> setVariables() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? getVal = pref.getString(Constant.USER_EMAIL_KEY);
    String? getPasVal = pref.getString(Constant.USER_PASSWORD_KEY);

    if (getVal == null ||
        getVal.isEmpty ||
        getPasVal == null ||
        getPasVal.isEmpty) {
      return false;
    }
    email = getVal;
    password = getPasVal;

    return true;
  }

  @override
  void initState() {
    super.initState();

    home_context = widget.home_context;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 155, 164, 255),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: getNamesAndOther(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                snapshot.hasError) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    grade,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ); // Show loading indicator
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    snapshot.data![1],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              );
                            }
                          })
                    ],
                  ),
                ],
              ),
            ),

            // this are the list of menus on the bar

            // The about option
            ListTile(
              leading: Icon(Icons.help),
              title: Text("About"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('About us.'),
                      content: Text(
                          'Our student-focused app provides comprehensive exam preparation resources, learning materials, and collaborative discussion forums to empower your academic success. Developed by educators and lifelong learners, our app is designed to streamline your learning experience and help you reach new heights. Thank you for choosing us as your study companion.'),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            // the feedback option
            const ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Feedback"),
            ),
            // The Log out
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: () async {
                clearSharedPref(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
