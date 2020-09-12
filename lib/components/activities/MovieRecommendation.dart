import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

/// A movie recommendation informational widget
class MovieRecommendation extends StatelessWidget {
  final String movieTitle;
  final String movieLink;

  MovieRecommendation(this.movieTitle, this.movieLink);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('We think you\'d love $movieTitle'),
          Linkify(
            text: 'You can give it a watch at $movieLink',
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
