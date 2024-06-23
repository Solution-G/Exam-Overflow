// ignore: file_names
import 'dart:convert';

import 'package:exam_overflow/src/blocs/provider.dart';
import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:exam_overflow/src/screens/loginApp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final user_name_controller = TextEditingController();
  final email_input_controller = TextEditingController();
  final verification_input_controller = TextEditingController();
  final password_input_controller = TextEditingController();
  Future<List<dynamic>> registerOnMysql(
      String name, String email, String password) async {
    Map<String, dynamic> result = {};
    try {
      final registry = await http.post(Uri.parse(Database.sign_up),
          body: {'name': name, 'email': email, "password": password});
      if (registry.statusCode == 200) {
        print(registry.body);
        result = jsonDecode(registry.body);
        if (result.containsKey("error")) {
          return [false, Database.errors_and_message[result['error'][0]]];
        }
        return [true, ''];
      } else {
        return [false, Database.errors_and_message[102]];
      }
    } catch (e) {
      return [false, "Connection error"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Container(
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
                      // These is where The Logo goes
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: const DecorationImage(
                              image: AssetImage('assets/logo.jpg'),
                            ),
                            borderRadius: BorderRadius.circular(300)),
                      ),
                      // This is the Input feilds
                      // The User name input feild

                      // InputFeild(
                      //     controller: user_name_controller,
                      //     hint: "Full Name",
                      //     obscureHInt: false),

                      Container(
                        padding: const EdgeInsets.all(20),
                        child: NameInput(bloc, user_name_controller),
                      ),

                      Container(
                        padding: const EdgeInsets.all(20),
                        child: EmailInput(bloc, email_input_controller),
                      ),

                      Container(
                        padding: const EdgeInsets.all(20),
                        child: PasswordInput(bloc, password_input_controller),
                      ),

                      Button(
                          onTap: () async {
                            var request = await registerOnMysql(
                                user_name_controller.text,
                                email_input_controller.text,
                                password_input_controller.text);
                            if (request[0] == true) {
                              Fluttertoast.showToast(msg: "Success !");
                              Navigator.pop(context);
                            } else {
                              Fluttertoast.showToast(msg: request[1]);
                            }
                          },
                          input: "Sign Up"),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account ? "),
                          Link(
                              input: "Log In",
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
