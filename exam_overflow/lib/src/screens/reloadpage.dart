import 'package:exam_overflow/src/screens/loginApp.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ReloadPage extends StatefulWidget {
  const ReloadPage({super.key});

  @override
  State<ReloadPage> createState() => _ReloadPageState();
}

class _ReloadPageState extends State<ReloadPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller; // Changed to late final
  Animation? animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    controller
        .forward(); // Changed from controller?.forward() to controller.forward()
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Added dispose method to clean up the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 187, 192, 248),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centering the content
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    "assets/logo.jpg",
                    height: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),


                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "ExamOverFlow",
                        textStyle: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: Duration(milliseconds: 100),
                      )
                    ],
                    totalRepeatCount: 1,
                    onFinished: () => Navigator.push(context , MaterialPageRoute(builder: (context)=>LogIn()))
                  )
                ],
              )
            ],
          ),
        ));
  }
}
