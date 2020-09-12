import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:flutter/material.dart';

/// Screen that displays all of a user's achivements with achievement cards describing each.
class AchievementListScreen extends StatelessWidget {
  final int numBadges = 5;

  @override
  Widget build(BuildContext context) {
    return MainHeaderAndNavigation(
      title: 'Achievements',
      child: Container(
        color: Color(0xFFEFBC9D),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusBar(numBadges),
            Expanded(
              child: ListView(
                children: [
                  AchievementCard('title', 'description of the award', ActivityType.PHYSICAL),
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
  final ActivityType activityType;

  /// Constructs an achievment card with a given title and description.
  AchievementCard(this.title, this.description, this.activityType);

  /// Finds the corresponding icon path for the activity type that will be displayed with the
  /// achievement.
  String findImageByActivityType(ActivityType type) {
    switch (type) {
      case ActivityType.ADVENTURE:
        return 'assets/images/oaadbadgeadventure-01.png';
      case ActivityType.ARTSY:
        return 'assets/images/oaadbadgeartsy-01.png';
      case ActivityType.COOKING:
        return 'assets/images/oaadbadgechef-01.png';
      case ActivityType.KINDNESS:
        return 'assets/images/oaadbadgekind-01.png';
      case ActivityType.MENTAL:
        return 'assets/images/oaddbadgeeinstein-01.png';
      case ActivityType.PHYSICAL:
        return 'assets/images/oaddbadgelift-01.png';
      default:
        return 'assets/images/oaddbadgelift-01.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            this.findImageByActivityType(this.activityType),
            height: 75,
            width: 75,
          ),
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

/// The activity types that can be represented in an activity
enum ActivityType { ADVENTURE, ARTSY, COOKING, KINDNESS, MENTAL, PHYSICAL }
