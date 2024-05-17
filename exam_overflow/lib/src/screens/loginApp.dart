
import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import 'components.dart';

class LoginApp extends StatelessWidget {
  void request_register(){}
  Widget build(context){

    final bloc = Provider.of(context);

    return Container(
      decoration: const  BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/background.png'),
        fit:BoxFit.cover,
        ) 
      ),
      child:Center(
         child:SingleChildScrollView(
         child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
        children: [
          //This is where the logo would go.
           Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: const DecorationImage(
                          image: AssetImage('assets/logo.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(360)),
                  ),
           SizedBox(height: 60,),       
           email( bloc),
           
           password(bloc), 
          SizedBox(height: 30,),
           submitButton( bloc),
           SizedBox(height: 30,),
           Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ? "),
                      Link(input: "Create account", onTap: request_register),
                    ],
                  )
        ],),))
    );
  }
  Widget email(Bloc bloc){
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
      return Container(
        width: 410,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(100, 86, 132, 186)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 155, 146, 146)),
              ),
              fillColor: snapshot.hasError ? Colors.red[200] : Color.fromARGB(70, 88, 148, 238),
              filled: true,
              errorText: snapshot.error?.toString(),
              labelText: 'Email',
              hintText: "yourEmail@gmail.com",
            ),
          ),
        ),
      );
    },
  );
}

 Widget password(Bloc bloc){
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return Container(
        width: 410,
      
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(100, 86, 132, 186)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 155, 146, 146)),
              ),
              fillColor: snapshot.hasError ? Colors.red[200] : Color.fromARGB(70, 88, 148, 238),
              filled: true,
              errorText: snapshot.error?.toString(),
              hintText: 'Password',
              labelText: 'password',
            ),
          ),
        ),
      );
    },
  );
}

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream:bloc.submitValid ,
      builder: (context, snapshot) {
        return Container(
          width:340,
          height: 55,
         child: ElevatedButton(
      onPressed:(snapshot.hasData)?  bloc.submit : null,
       child:  Text('Log In' ,style:TextStyle(
        color:Colors.white,fontWeight: FontWeight.bold,
       ),),
       style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 20),
       disabledBackgroundColor: Color.fromARGB(255, 66, 92, 122),
       backgroundColor: Color.fromARGB(255, 64, 121, 187)
       ),
      ));
      }
       ,);
    
  }
}