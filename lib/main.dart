import 'package:api_rm/dashboard.dart';
import 'package:api_rm/list_rm.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(Splash());
}

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return FormSplash();
  }
  
}

class FormSplash extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dash' : (context) => Dashboard(),
        //'/api' : (context) => ListApi(),
      },
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: Personajes(),
        title: Text("Bienvenido...", 
        style: TextStyle(
          fontSize: 20, 
          color: Colors.white,
          fontWeight: FontWeight.bold
          )  
          ),   
          gradientBackground: new LinearGradient(colors:[Colors.black,Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
          image: Image.asset("images/logo_itc.png"),
          loadingText: Text("Cargando aplicación..."),
          photoSize: 50,
          loaderColor: Colors.white,
      ),
    );
      
    
  }
  
}