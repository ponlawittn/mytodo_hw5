import 'package:flutter/material.dart';

import 'mytodo.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDoo',

      theme: ThemeData(
        primarySwatch: Colors.lightBlue,

      ),

      home: MytodoPage(),

    );
  }
}