import 'dart:ffi';

import 'package:exam_overflow/src/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String input;
  const Button({super.key, this.onTap, required this.input});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 86, 132, 186),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            input,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Link extends StatelessWidget {
  final Function()? onTap;
  final String input;

  const Link({super.key, required this.input, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(
          input,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 119, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// This is the costum Input class with the validation

class CustomTextField extends StatelessWidget {
  final Stream<String> stream;
  final Function(String) onChanged;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.stream,
    required this.onChanged,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(100, 86, 132, 186)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 155, 146, 146)),
            ),
            fillColor: snapshot.hasError
                ? Colors.red[200]
                : const Color.fromARGB(70, 88, 148, 238),
            filled: true,
            errorText: snapshot.error?.toString(),
            labelText: labelText,
          ),
        );
      },
    );
  }
}

// ignore: non_constant_identifier_names
Widget EmailInput(Bloc bloc) {
  return CustomTextField(
    stream: bloc.email,
    onChanged: bloc.changeEmail,
    labelText: 'Email',
    keyboardType: TextInputType.emailAddress,
  );
}

// ignore: non_constant_identifier_names
Widget PasswordInput(Bloc bloc) {
  return CustomTextField(
    stream: bloc.password,
    onChanged: bloc.changePassword,
    labelText: 'Password',
    obscureText: true,
  );
}

Widget NameInput(Bloc bloc) {
  return CustomTextField(
    stream: bloc.password,
    onChanged: bloc.changePassword,
    labelText: 'Full Name',
    obscureText: true,
  );
}
