import 'package:flutter/material.dart';

class ActivitySuggestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Does nothing because we're already on the home page
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  // Does nothing currently but will take the user to the streak page
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.stars),
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
