import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Splashlogo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splashlogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new Home(),
      backgroundColor: Color(0xFFF5F5F5),
      image: new Image.asset('images/oaddlogosplash-01.png'),
      loadingText: new Text('developed by NUFlexagonsTM'),
      photoSize: 125.0,
      loaderColor: Colors.orange,
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF545F5),

    );
  }
}

