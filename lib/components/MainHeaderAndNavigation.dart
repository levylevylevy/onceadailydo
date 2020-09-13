import 'package:flutter/material.dart';

/// A widget that wraps screens, adding a header with our logo and a footer with navigational
/// buttons.
class MainHeaderAndNavigation extends StatelessWidget {
  Widget child;
  String title;

  /// Whether this widget should display the footer or not
  bool displayFooter;

  /// Constructs a MainHeaderAndNavigation with the given child that will be placed between the
  /// header and navigational footer.
  MainHeaderAndNavigation({this.title = "Once a Daily Do", this.child, this.displayFooter = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.child,
      appBar: AppBar(
        leading: Container(), // For the sake of hiding the back button
        title: Row(
          children: [
            Image.asset(
              'assets/images/oaddlogosplash-01.png',
              width: 70,
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                this.title,
                style: TextStyle(color: Color(0xFF52606F),),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF5F5F5),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFF566575),
      bottomNavigationBar: displayFooter
      ? Container(
        color: Color(0xFFF5F5F5),
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                child: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/suggestions');
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.pushNamed(context, '/streaks');
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Icon(Icons.stars),
                onPressed: () {
                  Navigator.pushNamed(context, '/achievements');
                },
              ),
            ),
          ],
        ),
      )
      : null,
    );
  }
}
