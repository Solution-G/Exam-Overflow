import 'package:exam_overflow/src/screens/sidebar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 155, 164, 255),
          title: const Text(
            "Exam Overflow",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
