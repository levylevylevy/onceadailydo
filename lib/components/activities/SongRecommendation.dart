import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

/// A song recommendation informational widget
class SongRecommendation extends StatelessWidget {
  final String songTitle;
  final String songArtist;
  final String songLink;

  SongRecommendation(this.songTitle, this.songArtist, this.songLink);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('We think you\'d love $songTitle by $songArtist'),
          Linkify(
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              } else {
                throw 'Could not launch $link';
              }
            },
            text: 'Go give it a listen here! $songLink',
          ),
        ],
      ),
    );
  }
}
