import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/screens/HomeScreen.dart';
import 'package:splashscreen/splashscreen.dart';
// import '../conf/configuration.dart';
import '../constants.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      backgroundColor: Color.fromRGBO(4, 6, 28, 0.9),
      navigateAfterSeconds: new HomeScreen(),
      title: new Text(
        'Coronavirus in the world',
        style: titleSplashStyle,
        textScaleFactor: 2,
      ),
      //image: new Image.network(PATH_IMAGE_SPLASH),
      image: Image(
        image: AssetImage('images/coronavirus.gif'),
      ),
      loadingText: Text("Loading", style: titleSplashStyle),
      photoSize: 150.0,
      loaderColor: Colors.blue,
    );
  }
}
