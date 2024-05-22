import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';

class Exam extends StatelessWidget {
  Exam({super.key});

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
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TopTitle(title: "Exam"),
                  for (int x = 0; x < 20; x++)
                    MyCard(
                      title: "Math",
                      icon_url: 'assets/test.png',
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

// This is a page that is going to be helping as exam hall
class TakeExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background_2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 155, 164, 255),
              ),
              height: 100,
              child: const Center(
                child: Text(
                  "30:00",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Question(
                    row_no: 1,
                    question: "What is 1 + 1 ?",
                    choose: const ["What the", "Yeah men", "Lets see", "Woow"],
                    answer: 8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
