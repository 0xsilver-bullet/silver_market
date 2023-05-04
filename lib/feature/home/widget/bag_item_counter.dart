import 'package:flutter/material.dart';

import 'package:silver_market/theme.dart';

class BagItemCounter extends StatelessWidget {
  const BagItemCounter({
    Key? key,
    required this.count,
    this.onInc,
    this.onDec,
  }) : super(key: key);

  final int count;
  final VoidCallback? onInc;
  final VoidCallback? onDec;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: SilverAppColors.giratina100,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: InkWell(
              onTap: onDec,
              child: const Icon(Icons.remove),
            ),
          ),
          const SizedBox(width: 16),
          Text(count.toString()),
          const SizedBox(width: 16),
          SizedBox(
            width: 20,
            height: 20,
            child: InkWell(
              onTap: onInc,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
