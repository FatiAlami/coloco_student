import 'package:colocationprojet/map.dart';
import 'package:flutter/material.dart';
import 'dash.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String,WidgetBuilder>{
        '/landingpage':(BuildContext context) => new MyApp(),
        '/signup':(BuildContext context) => new SignupPage(),
        '/homepage':(BuildContext context) => new HomePage(),
        '/map':(BuildContext context) => new MyMapPage(),
        '/dash':(BuildContext context) => new DashboardPage(),
      },
    );
  }
}
