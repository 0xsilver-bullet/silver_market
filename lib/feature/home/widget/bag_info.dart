import 'package:flutter/material.dart';

import 'package:silver_market/core/model/models.dart';
import 'package:silver_market/theme.dart';

class BagInfo extends StatelessWidget {
  const BagInfo({
    Key? key,
    required this.bag,
    required this.finalTotal,
    this.descount,
  }) : super(key: key);

  final Bag bag;
  final double finalTotal;
  final double? descount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '\$$finalTotal',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
        // Make this row optional and see if there is a promo code
        if (descount != null) ...[
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Promocode',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: SilverAppColors.giratina500),
              ),
              Text(
                '-\$$descount',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: SilverAppColors.giratina500),
              ),
            ],
          ),
        ]
      ],
    );
  }
}
