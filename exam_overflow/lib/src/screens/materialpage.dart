// material_page.dart
import 'package:flutter/material.dart';

// 
class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 

        toolbarHeight: 200,
        title: Text("material page"),
        backgroundColor: Colors.red,
      ),
      body: Container( 
        color: Colors.blue,
      ),
    );
  }
}