import 'package:flutter/material.dart';

/// A widget that wraps screens, adding a header with our logo and a footer with navigational
/// buttons. 
class MainHeaderAndNavigation extends StatelessWidget {
  Widget child;

  /// Constructs a MainHeaderAndNavigation with the given child that will be placed between the
  /// header and navigational footer.
  MainHeaderAndNavigation({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.child,
      appBar: AppBar(
        title: Text(
          'TODO: Logo here',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFF566575),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                child: Icon(Icons.home),
                onPressed: () {
                  // Does nothing because we're already on the home page
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Icon(Icons.calendar_today),
                onPressed: () {
                  // Does nothing currently but will take the user to the streak page
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Icon(Icons.stars),
                onPressed: () {
                  // Does nothing currently but will take users to the achievements page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}