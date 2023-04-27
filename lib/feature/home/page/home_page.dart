import 'package:flutter/material.dart';
import 'package:silver_market/utils/data_samples.dart';

import '../widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          'Silver Market',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: SearchField(),
        ),
        SizedBox(
          height: 108,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            itemCount: DataSamples.stories.length,
            itemBuilder: (_, index) =>
                StoryItem(story: DataSamples.stories[index]),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: DataSamples.homeParts.length,
              itemBuilder: (_, index) => HomePartItem(
                homePart: DataSamples.homeParts[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
