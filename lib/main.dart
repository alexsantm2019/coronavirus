import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronavirus in the world',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
