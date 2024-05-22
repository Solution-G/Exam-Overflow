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
// this widget is for the red container with text

class TopTitle extends StatelessWidget {
  final String title;
  TopTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 193, 72, 95),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(70), bottomLeft: Radius.circular(70)),
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
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
// this widget will be the card to desplay each exam info

class MyCard extends StatelessWidget {
  final String title;
  String subtitle;
  String subtext;
  final String icon_url;
  MyCard(
      {super.key,
      required this.title,
      required this.icon_url,
      this.subtitle = '',
      this.subtext = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: .5,
            blurRadius: 3,
          )
        ],
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(icon_url),
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                subtext,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// this is question widget

class Question extends StatelessWidget {
  final int row_no;
  final String question;
  final List<String> choose;
  final int answer;
  String selected = 'z';
  Question(
      {super.key,
      required this.row_no,
      required this.question,
      required this.choose,
      required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          RadioListTile(
            groupValue: selected,
            onChanged: (value) {
              selected = value!;
            },
            value: 'a',
            title: Text(choose[0]),
          ),
          RadioListTile(
            groupValue: selected,
            onChanged: (value) {
              selected = value!;
            },
            value: 'a',
            title: Text(choose[1]),
          ),
          RadioListTile(
            groupValue: selected,
            onChanged: (value) {
              selected = value!;
            },
            value: 'a',
            title: Text(choose[2]),
          ),
          RadioListTile(
            groupValue: selected,
            onChanged: (value) {
              selected = value!;
            },
            value: 'a',
            title: Text(choose[3]),
          ),
        ],
      ),
    );
  }
}
