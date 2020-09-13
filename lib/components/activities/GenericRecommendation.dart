import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

/// A arts and crafts recommendation informational widget
class GenericRecommendation extends StatelessWidget {
  final String title;
  final String description;

  GenericRecommendation(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(this.title, style: TextStyle(fontWeight: FontWeight.bold)),
          Linkify(
            text: this.description,
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              }
            },
          ),
        ],
      ),
    );
  }
}
