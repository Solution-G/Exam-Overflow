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
            // This will set the scaffhold background transparent so that the background setted by the container will be visible
            backgroundColor: Colors.transparent,
            // to scroll for available exams Listed
            body: ListView(
              children: [
                TopTitle(title: "Exam"),
                for (int i = 0; i < 20; i++)
                  const Card(
                    // using the list tile for listing the available exams
                    child: ListTile(
                      leading: Image(image: AssetImage('assets/test.png')),
                      title: Text("Math",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      subtitle: Text("Grade 10"),
                      isThreeLine: true,
                      trailing: Text("30min"),
                    ),
                  ),
              ],
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
      // the following is to set the background image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background_2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          //=============================================//
          // this will be used to display timer =========//
          //=============================================//
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
            // This will help to scroll down the questions
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // the question will call the Question Card from the component file
                  // and give the following as an argument
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
