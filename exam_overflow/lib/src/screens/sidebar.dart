import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 155, 164, 255),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "Grade 12",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // this are the list of menus on the bar

            // The about option
            const ListTile(
              leading: Icon(Icons.help),
              title: Text("About"),
            ),
            // the feedback option
            const ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Feedback"),
            ),
            // The Log out
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
