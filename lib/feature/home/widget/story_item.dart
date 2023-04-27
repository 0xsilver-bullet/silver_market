import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:silver_market/core/model/story.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key? key,
    required this.story,
  }) : super(key: key);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: CachedNetworkImageProvider(story.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          story.name,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
