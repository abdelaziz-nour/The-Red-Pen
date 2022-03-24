import 'package:flutter/material.dart';
import 'package:training/add_case.dart';
import 'package:training/add_payment.dart';
import 'package:training/cases.dart';
import 'package:training/history.dart';
import 'package:training/payment.dart';
import 'package:training/recieved.dart';
import 'package:training/register.dart';
import 'package:training/report.dart';
import 'package:training/welcom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your appli flutter pub run flutter_launcher_icons:main cation.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
    );
  }
}

