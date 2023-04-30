import 'package:flutter/material.dart';

import 'package:silver_market/core/model/models.dart';
import 'package:silver_market/theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    this.onClick,
  }) : super(key: key);

  final Product product;
  final Function(Product)? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => onClick?.call(product),
                  child: Image.network(
                    product.imagesUrls[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (product.isFavorite || product.discount != null)
              Container(
                margin: const EdgeInsets.only(top: 8.0, left: 8.0),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: SilverAppColors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  product.discount != null ? '-${product.discount}%' : 'New',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              onPressed: () {},
              splashRadius: 16,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 24,
              ),
            )
          ],
        ),
        Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: SilverAppColors.giratina500),
        )
      ],
    );
  }
}
