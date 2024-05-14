import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import 'loginApp.dart';

class AlternativeSignIn extends StatelessWidget {
  Widget build(context){

    final bloc = Provider.of(context);

   return Scaffold(
    resizeToAvoidBottomInset: false,
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
      backgroundColor: Colors.grey[900], 
      centerTitle: true, 
    ),
  ),
      body: Container(
        height: 720,
        color:  Colors.grey[900], // Dark background color
        margin:EdgeInsets.only(top:50.0 ,left: 20, right: 20),
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
                    color: const Color.fromARGB(255, 34, 112, 247), // Vibrant accent color
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
        style: TextStyle(color: Colors.white),
        onChanged: bloc.changeName,
        decoration: InputDecoration(
        errorText: snapshot.error?.toString(),
        labelText: '   Name',
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
    style: TextStyle(color: Colors.white),
      onChanged: bloc.changeEmail,
      keyboardType:TextInputType.emailAddress,
      decoration: InputDecoration(
        errorText: snapshot.error?.toString(),
        labelText: '   Email',
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
        style: TextStyle(color: Colors.white),
        onChanged: bloc.changePassword,
      obscureText: true,
      decoration:InputDecoration(
        errorText: snapshot.error?.toString(),
        hintText: 'Password',
        labelText:'   password',
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
       child:  Text('SignUP',style: TextStyle(fontSize: 18.0),),
      );
      }
       ,);
      
  }
}
