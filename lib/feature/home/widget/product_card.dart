import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:silver_market/core/model/models.dart';
import 'package:silver_market/theme.dart';

/// Used for showing the product in bag or in saved products list.
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.onClear,
    this.actionWidget,
  }) : super(key: key);

  final Product product;
  final VoidCallback? onClear;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 115,
          width: 94,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: CachedNetworkImageProvider(product.imagesUrls[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: onClear,
                    splashRadius: 20,
                    icon: SvgPicture.asset('assets/images/clear.svg'),
                  )
                ],
              ),
              Text(
                product.description,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: SilverAppColors.giratina500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (actionWidget != null) ...[
                const SizedBox(height: 8.0),
                actionWidget!
              ]
            ],
          ),
        ),
      ],
    );
  }
}
