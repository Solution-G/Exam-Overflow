import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyMaterial extends StatefulWidget {
  MyMaterial({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyMaterialView();
  }
}

// ignore: must_be_immutable
class MyMaterialView extends State<MyMaterial> {
  Map<String, dynamic> available_materials = {"Math": "100"};

  // @override
  // void initState() {
  //   load_materials();
  // }

  // Future<Map<dynamic, dynamic>> load_materials() async {
  //   var result = await http.post(Uri.parse(Database.load_material),
  //       body: {'grade': "12", "subject": "math"});
  //   if (result.statusCode == 200) {
  //     Map<String, dynamic> value = jsonDecode(result.body);
  //     return value['data'];
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 193, 72, 95)),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            // This will set the scaffhold background transparent so that the background setted by the container will be visible
            backgroundColor: Colors.transparent,
            // to scroll for available exams Listed
            body: ListView(
              children: [
                TopTitle(title: "Material"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
