import 'package:HopHacks/screens/AchievementListScreen.dart';
import 'package:HopHacks/screens/ActivitySuggestionScreen.dart';
import 'package:HopHacks/screens/SplashScreen.dart';
import 'package:HopHacks/screens/StreakScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(OnceADailyDo());
}

/// The main class for this app.
class OnceADailyDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Splashlogo(),
        '/suggestions': (context) => ActivitySuggestionScreen(),
        '/achievements': (context) => AchievementListScreen(),
        '/streaks': (context) => StreaksScreen(),
      }
    );
  }
}
