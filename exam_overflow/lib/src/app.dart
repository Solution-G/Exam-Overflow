import 'screens/loginApp.dart';
import 'package:flutter/material.dart';
 import 'blocs/provider.dart';
 
 class MyApp extends StatelessWidget {

  @override
  ///build method that returns a new widget tree that can incorporate pices of the
  ///old widget tree(a provider that contains MaterialApp)
 build(BuildContext context) {
    return Provider(
      
      child: MaterialApp(
      title: 'Bloc login App',
      home:Scaffold(
        body: LoginApp(),
       )
    ),
    );
  }
} 