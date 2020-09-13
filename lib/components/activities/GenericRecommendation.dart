import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// A arts and crafts recommendation informational widget
class GenericRecommendation extends StatelessWidget {
  final String title;
  final String description;

  GenericRecommendation(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Markdown(data: '## $title\n\n$description');
  }
}
