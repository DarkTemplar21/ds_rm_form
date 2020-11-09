
import 'package:ds_richmeat_form/widgets/LoginDialog.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
void main(){
  runApp( MaterialApp(
    theme: ThemeData(
      textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
    ),
    home:  MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() =>  _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
        seconds: 3,
        routeName: "/",
        navigateAfterSeconds:  LoginDialog(),
        title:  Text('Welcome In SplashScreen',
          style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image:  Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader:  TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
          title:  Text("Welcome In SplashScreen Package"),
          automaticallyImplyLeading: false
      ),
      body:  Center(
        child:  Text("Done!",
          style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),),
      ),
    );
  }
}