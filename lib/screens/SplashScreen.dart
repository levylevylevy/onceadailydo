import 'package:HopHacks/screens/NewUserFormScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

/// The splash screen to display before the app loads.
class Splashlogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new NewUserFormScreen(),
      backgroundColor: Color(0xFFF5F5F5),
      image: new Image.asset('assets/images/oaddlogosplash-01.png'),
      loadingText: new Text('developed by NUFlexagonsTM'),
      photoSize: 125.0,
      loaderColor: Colors.orange,
    );
  }
}