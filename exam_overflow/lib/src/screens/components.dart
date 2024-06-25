import 'package:exam_overflow/src/blocs/bloc.dart';
import 'package:flutter/material.dart';

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

// this class is used for the blog creation in the landing page
class RoundedBlog extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final String image;
  const RoundedBlog(
      {super.key,
      required this.title,
      required this.image,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onpress,
          child: Container(
            height: 160,
            width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(66, 28, 9, 9),
                  offset: Offset(0, 4),
                  blurRadius: 20.0,
                  blurStyle: BlurStyle.outer)
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Image(image: AssetImage(image)),
          ),
        ),
        Text(
          title,
        )
      ],
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
  final controller;

  const CustomTextField(
      {super.key,
      required this.stream,
      required this.onChanged,
      required this.labelText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          controller: controller,
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
Widget EmailInput(Bloc bloc, controller) {
  return CustomTextField(
    stream: bloc.email,
    onChanged: bloc.changeEmail,
    labelText: 'Email',
    keyboardType: TextInputType.emailAddress,
    controller: controller,
  );
}

// ignore: non_constant_identifier_names
Widget PasswordInput(Bloc bloc, controller) {
  return CustomTextField(
    stream: bloc.password,
    onChanged: bloc.changePassword,
    labelText: 'Password',
    obscureText: true,
    controller: controller,
  );
}

Widget NameInput(Bloc bloc, controller) {
  return CustomTextField(
    stream: bloc.name,
    onChanged: bloc.changeName,
    labelText: 'Full Name',
    obscureText: false,
    controller: controller,
  );
}
// this widget is for the red container with text

class TopTitle extends StatelessWidget {
  final String title;
  TopTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 193, 72, 95),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 10)),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String label;
  final controller;
  final int maxLine;
  Input(
      {super.key,
      required this.label,
      required this.controller,
      required this.maxLine});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        maxLines: this.maxLine,
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(100, 86, 132, 186)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 155, 146, 146)),
          ),
          fillColor: const Color.fromARGB(70, 88, 148, 238),
          filled: true,
          labelText: label,
        ),
      ),
    );
  }
}
