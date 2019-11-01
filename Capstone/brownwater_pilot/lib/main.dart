import 'package:flutter/material.dart';
import 'package:brownwater_pilot/pages/signup.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brownwater Pilot',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: SignupPage(),
    );
  }
} 