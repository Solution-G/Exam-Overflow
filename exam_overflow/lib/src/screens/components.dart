import 'dart:ffi';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class InputFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureHInt;
  const InputFeild(
      {super.key,
      required this.controller,
      required this.hint,
      required this.obscureHInt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        obscureText: this.obscureHInt,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(100, 86, 132, 186)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 155, 146, 146)),
          ),
          fillColor: const Color.fromARGB(56, 88, 148, 238),
          filled: true,
          hintText: hint,
        ),
      ),
    );
  }
}

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
  const RoundedBlog({super.key, required this.title, required this.image , required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        TextButton(
          onPressed: onpress,
          child: Container(
            height: 160,
            width: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                color:const Color.fromARGB(66, 28, 9, 9),
                offset: Offset(0 , 4),
                blurRadius: 20.0,
                blurStyle: BlurStyle.outer
              )
              ],
                borderRadius: BorderRadius.circular(10), color: Colors.white),
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
