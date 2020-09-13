import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:flutter/material.dart';

/// Screen that displays all of a user's achivements with achievement cards describing each.
class AchievementListScreen extends StatelessWidget {
  final int numBadges = 6;

  @override
  Widget build(BuildContext context) {
    return MainHeaderAndNavigation(
      title: 'Achievements',
      child: Container(
        color: Color(0xFFEFBC9D),
        child: Column(
          children: [
            StatusBar(numBadges),
            Expanded(
              child: ListView(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AchievementCard(
                          'Do You Even Lift?',
                          'Completed 5 physical activites',
                          ActivityType.PHYSICAL)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AchievementCard(
                          'Einstein Award',
                          'Completed 5 big 🧠 activities',
                          ActivityType.MENTAL)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AchievementCard(
                          'Artsy Artist',
                          'Completed 5 arts or crafts activities',
                          ActivityType.ARTSY)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AchievementCard('Master Chef',
                          'Tried five new recipes 😋', ActivityType.COOKING)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AchievementCard(
                          'Adventurer',
                          'Completed 5 outdoors activities',
                          ActivityType.ADVENTURE)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AchievementCard(
                          'Certificate of Kindness ',
                          'Completed five activities to help your community or friends. What a great person!',
                          ActivityType.KINDNESS)),
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                this.findImageByActivityType(this.activityType),
                height: 75,
                width: 75,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(this.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The activity types that can be represented in an activity
enum ActivityType { ADVENTURE, ARTSY, COOKING, KINDNESS, MENTAL, PHYSICAL }
