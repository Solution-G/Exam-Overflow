import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import 'loginApp.dart';

class AlternativeSignIn extends StatelessWidget {
  Widget build(context){

    final bloc = Provider.of(context);

   return Scaffold(
      body: Container(
        color:  Colors.grey[900], // Dark background color
        margin:EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
              child: Image.asset('assets/logo.png', width: 140, height: 140),
            ),
            SizedBox(height: 20.0), 
                name(bloc),
                SizedBox(height: 20.0), // Add some space
                alternativeEmail(bloc),
                SizedBox(height: 20.0), // Add some space
                alternativePassword(bloc),
                SizedBox(height: 20.0), // Add some space
                alternativeSubmitButton(bloc),
                SizedBox(height: 20.0), // Add some space
                Text("Already have an account?", style: TextStyle(fontSize: 18.0, color: Colors.white)),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,'/loginApp');
                  },
                  child: Text('Log In', style: TextStyle(
                    color: Colors.blueAccent, // Vibrant accent color
                    backgroundColor: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 18.0, // Make the text a bit larger
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget name(Bloc bloc){
    return StreamBuilder(stream: bloc.name, 
    builder: ((context, snapshot) {
      return TextField(
        onChanged: bloc.changeName,
        decoration: InputDecoration(
        errorText: snapshot.error?.toString(),
        labelText: 'Name',
        hintText: "Your name",  
        labelStyle: TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 216, 229, 238),), // Make the label a bit larger
            hintStyle: TextStyle(fontSize: 16.0,
            color: Color.fromARGB(255, 224, 228, 224),),
        ),
      );
    }),);
  }

  Widget alternativeEmail(Bloc bloc){
     return StreamBuilder(stream: bloc.email,
     builder:(context, snapshot) {
   return TextField(
      onChanged: bloc.changeEmail,
      keyboardType:TextInputType.emailAddress,
      decoration: InputDecoration(
        errorText: snapshot.error?.toString(),
        labelText: 'Email',
        hintText: "yourEmail@gmail.com",
        labelStyle: TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 216, 229, 238),), // Make the label a bit larger
            hintStyle: TextStyle(fontSize: 16.0,
            color: Color.fromARGB(255, 224, 228, 224),),
      ),

    );
     },)
   ;
  }

  Widget alternativePassword(Bloc bloc){
     return StreamBuilder(stream: bloc.password,
    builder:(context, snapshot) {
      return TextField(
        onChanged: bloc.changePassword,
      obscureText: true,
      decoration:InputDecoration(
        errorText: snapshot.error?.toString(),
        hintText: 'Password',
        labelText:'password',
        labelStyle: TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 216, 229, 238),), // Make the label a bit larger
            hintStyle: TextStyle(fontSize: 16.0,
            color: Color.fromARGB(255, 224, 228, 224),),
      )
      

    );
    },) ;
  }

  Widget alternativeSubmitButton(Bloc bloc){
      return StreamBuilder(
      stream:bloc.submitValid ,
      builder: (context, snapshot) {
        return ElevatedButton(
      onPressed:(snapshot.hasData)?  bloc.submit : null,
       child:  Text('SignIn',style: TextStyle(fontSize: 18.0),),
      );
      }
       ,);
      
  }
}
