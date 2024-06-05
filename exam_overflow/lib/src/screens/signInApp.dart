// ignore: file_names
import 'package:exam_overflow/src/blocs/provider.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:exam_overflow/src/screens/loginApp.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final user_name_controller = TextEditingController();
  final email_input_controller = TextEditingController();
  final verification_input_controller = TextEditingController();
  final password_input_controller = TextEditingController();
  void log_in() {}

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
                        child: PasswordInput(bloc, email_input_controller),
                      ),

                      
                      Button(onTap: () {}, input: "Sign Up"),

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
