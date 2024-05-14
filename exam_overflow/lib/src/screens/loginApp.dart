
import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginApp extends StatelessWidget {
  Widget build(context){

    final bloc = Provider.of(context);

    return  Scaffold(
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // Change this value to control the height
        child: AppBar(
      title: Text(
        'EXAM OVERFLOW',
        style: TextStyle(
          fontSize: 20.0,fontWeight:FontWeight.bold ,
          color: Colors.white,
        ),
      ),
      backgroundColor:Colors.grey[900], 
      centerTitle: true, 
    ),
  ),
     body:SingleChildScrollView(
     child:Container(
      height:720,
      color: Colors.grey[900], // Dark background color
      margin:EdgeInsets.only(top:50.0 ,left: 20, right: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset('assets/logo.png', width: 140, height: 140),
            ),
            SizedBox(height: 40.0), // Add some space
            email(bloc),
            SizedBox(height: 20.0), // Add some space
            password(bloc),
            SizedBox(height: 20.0), // Add some space
            submitButton(bloc),
            SizedBox(height: 20.0), // Add some space
            Text("Don't have an account?", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,'/alternativeSignIn');
              },
              child: Text('Sign up', style: TextStyle(
                color: const Color.fromARGB(255, 32, 111, 246), // Vibrant accent color
                backgroundColor: Colors.white,
                decoration: TextDecoration.underline,
                fontSize: 18.0, // Make the text a bit larger
              ),
              ),
            ),
          ],
        ),
      )
    )));
  }

  Widget email(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder:(context, snapshot) {
        return TextField(
          style: TextStyle(color: Colors.white),
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
          errorText: snapshot.error?.toString(),
          labelText: '   Email',
          hintText: "yourEmail@gmail.com",
          labelStyle: TextStyle(
          fontSize: 18.0, // Make the label a bit larger
          color: Color.fromARGB(255, 216, 229, 238), // This changes the color of the label
        ),
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: const Color.fromARGB(255, 224, 228, 224), // This changes the color of the hint
        ),
      ),
)
;
      },
    );
  }

  Widget password(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder:(context, snapshot) {
        return TextField(
          style: TextStyle(color: Colors.white),
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.error?.toString(),
            hintText: 'Password',
            labelText:'   password',
            labelStyle: TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 216, 229, 238),), // Make the label a bit larger
            hintStyle: TextStyle(fontSize: 16.0,
            color: Color.fromARGB(255, 224, 228, 224),), // Make the hint a bit larger
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream:bloc.submitValid ,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed:(snapshot.hasData)?  bloc.submit : null,
          child:  Text('Login', style: TextStyle(fontSize: 18.0)), // Make the text a bit larger
        );
      },
    );
  }
}
