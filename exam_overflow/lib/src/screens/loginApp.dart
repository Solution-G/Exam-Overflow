// ignore: file_names

import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:exam_overflow/src/screens/contants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/provider.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  _LogIn createState() => _LogIn();
}

/// This is Log in class responsible for handling the the user Logging in process
class _LogIn extends State<LogIn> {
  // This will help me to controll the input text because it in different Class called component

  // ignore: non_constant_identifier_names
  final email_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final user_password_controller = TextEditingController();
  Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
  bool loggedIn = false;

  // This is the function that is going to be called whenever the login button is clicked
  Future<List> log_in(String email, String password) async {
    try {
      final result = await http.post(Uri.parse(Database.log_in),
          body: {"student_email": email, "student_password": password});

      if (result.statusCode == 200) {
        print(result.body);
        Map<String, dynamic> value = jsonDecode(result.body);
        if (value.containsKey('data')) {
          saveData(Constant.USER_EMAIL_KEY, email);
          saveData(Constant.USER_PASSWORD_KEY, password);
          saveData(Constant.USER_ID_KEY, value["data"]["user_id"]);
          print(
              "--------------Saved ---------------------------------------------");
          return [true, value['data']];
        }

        return [false, Database.errors_and_message[value['error'][0]]];
      } else {
        return [false, "Server is not connected!"];
      }
    } catch (e) {
      return [false, "Connection error!"];
    }
  }

  Future<void> saveData(String key, String data) async {
    SharedPreferences myShared = await sharedPref;

    await myShared.setString(key, data);
  }

  Future<void> alreadyLoggedIn(BuildContext context) async {
    SharedPreferences shP = await sharedPref;
    print("--------------loaded-------------------------");
    String? email = shP.getString(Constant.USER_EMAIL_KEY);
    String? password = shP.getString(Constant.USER_PASSWORD_KEY);
    if (email == null ||
        email.isEmpty ||
        password == null ||
        password.isEmpty) {
      return;
    }
    var request = await log_in(email, password);
    if (request[0]) {
      loggedIn = true;
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();
    alreadyLoggedIn(context);
  }

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      // this container will help us to change the background of the app
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //================================//
                  //This is where the logo would go.//
                  //================================//
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: const DecorationImage(
                          image: AssetImage('assets/logo.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(300)),
                  ),
                  // This is where the input feild would go
                  // Email name input feild
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: EmailInput(bloc, email_controller),
                  ),

                  // Password Input

                  Container(
                      padding: const EdgeInsets.all(20),
                      child: PasswordInput(bloc, user_password_controller)),

                  // sign in button

                  Button(
                      onTap: () async {
                        var request_login = await log_in(email_controller.text,
                            user_password_controller.text);
                        if (request_login[0]) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          Fluttertoast.showToast(msg: request_login[1]);
                        }
                      },
                      input: "Log In"),
                  // The link Text forwarding to sign up page
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ? "),
                      Link(
                          input: "Create account",
                          onTap: () {
                            Navigator.pushNamed(context, '/sign_up');
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
