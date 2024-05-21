// ignore: file_names
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../blocs/provider.dart';

/// This is Log in class responsible for handling the the user Logging in process
class LogIn extends StatelessWidget {
  // This will help me to controll the input text because it in different Class called component
  LogIn({super.key});
  final email_controller = TextEditingController();
  final user_password_controller = TextEditingController();

  // This is the function that is going to be called whenever the login button is clicked

  void log_in() {}

  // This function will require register
  void request_register() {
    print("Here");
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return MaterialApp(
      home: Container(
        child: Scaffold(
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
                        child: EmailInput(bloc),
                      ),

                      // Password Input

                      Container(
                          padding: const EdgeInsets.all(20),
                          child: PasswordInput(bloc)),

                      // sign in button

                      Button(onTap: log_in, input: "Log In"),
                      // The link Text forwarding to sign up page
                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account ? "),
                          Link(
                              input: "Create account", onTap: request_register),
                        ],
                      ),
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
