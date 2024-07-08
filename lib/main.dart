import 'package:flutter/material.dart';
import 'package:myapp/screens/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTrips',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: HomePage(),
    );
  }
}