import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:flutter/material.dart';

/// Screen that displays all of a user's achivements with achievement cards describing each.
class AchievementListScreen extends StatelessWidget {
  final int numBadges = 5;

  @override
  Widget build(BuildContext context) {
    return MainHeaderAndNavigation(
      child: Container(
        color: Color(0xFFEFBC9D),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusBar(numBadges),
            Expanded(
              child: ListView(
                children: [
                  AchievementCard('title', 'description of the award'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Status bar that describes how many badges a user has
class StatusBar extends StatelessWidget {
  final int numBadges;

  StatusBar(this.numBadges);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFF566575),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Congrats, you have collected $numBadges badges!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// Card that describes an achievement
class AchievementCard extends StatelessWidget {
  final String title;
  final String description;

  /// Constructs an achievment card with a given title and description.
  AchievementCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timelapse),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(this.description),
            ],
          ),
        ],
      ),
    );
  }
}
