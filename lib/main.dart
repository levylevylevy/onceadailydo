import 'package:HopHacks/screens/NewUserFormScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(OnceADailyDo());
}

/// The main class for this app.
class OnceADailyDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTextStyle(
        child: NewUserFormScreen(),
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
