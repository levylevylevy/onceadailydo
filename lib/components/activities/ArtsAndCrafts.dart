import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

/// A arts and crafts recommendation informational widget
class ArtsAndCrafts extends StatelessWidget {
  final String description;
  final String activityLink;

  ArtsAndCrafts(this.description, this.activityLink);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Try out this fun quick crafts project: $description'),
          Linkify(
            text: 'Get more info at $activityLink',
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              } else {
                throw 'Could not launch $link';
              }
            },
          ),
        ],
      ),
    );
  }
}
