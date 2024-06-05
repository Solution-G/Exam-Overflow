// ignore: file_names

import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../blocs/provider.dart';
import 'package:http/http.dart' as http;

/// This is Log in class responsible for handling the the user Logging in process
class LogIn extends StatelessWidget {
  // This will help me to controll the input text because it in different Class called component
  LogIn({super.key});
  // ignore: non_constant_identifier_names
  final email_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final user_password_controller = TextEditingController();

  // This is the function that is going to be called whenever the login button is clicked
  Future<List> log_in(String email, String password) async {
    final result = await http.post(Uri.parse(Database.log_in),
        body: {"student_email": email, "student_password": password});

    if (result.statusCode == 200) {
      Map<String, dynamic> value = jsonDecode(result.body);
      if (value.containsKey('data')) {
        return [true, value['data']];
      }
      print(value);
      return [false, Database.errors_and_message[value['error'][0]]];
    } else {
      return [false, "Server is connected!"];
    }
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
