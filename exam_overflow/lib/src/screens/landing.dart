import 'package:exam_overflow/src/screens/components.dart';
import 'package:exam_overflow/src/screens/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:exam_overflow/src/screens/materialpage.dart';

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
          backgroundColor: const Color.fromARGB(255, 155, 164, 255),
          title: const Text(
            "Exam Overflow",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_2.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Every single row is expanded into two componenets
                      Row(
                        children: [
                          Expanded(
                              child: RoundedBlog(
                            title: "Material",
                            image: 'assets/undraw_book_lover_re_rwjy.png',
                            onpress: () {
                              
                            },
                          )),
                          Expanded(
                              child: RoundedBlog(
                                  onpress: () {
                                    
                                  },
                                  title: "Study",
                                  image: 'assets/undraw_educator_re_ju47.png')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: RoundedBlog(
                                onpress: (){

                                },
                                  title: "Exam",
                                  image: 'assets/undraw_online_test_re_kyfx.png')),
                          Expanded(
                              child: RoundedBlog(
                                onpress: (){

                                },
                                  title: "Progress",
                                  image: 'assets/undraw_analysis_dq08.png')),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                              child: RoundedBlog(
                                onpress: (){

                                },
                                  title: "Question",
                                  image: 'assets/undraw_questions_re_1fy7.png')),
                          Expanded(
                              child: RoundedBlog(
                                onpress: (){

                                },
                                  title: "Solution",
                                  image: 'assets/undraw_my_answer_re_k4dv.png')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: RoundedBlog(
                                onpress: (){},
                                  title: "Give help",
                                  image: 'assets/undraw_lightbulb_moment_re_ulyo.png')),
                          Expanded(child: Text(""))
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
