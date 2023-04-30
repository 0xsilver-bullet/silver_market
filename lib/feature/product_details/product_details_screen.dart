import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:silver_market/core/widget/widgets.dart';
import 'package:silver_market/core/model/models.dart';
import 'package:silver_market/core/blocs/blocs.dart';
import 'package:silver_market/theme.dart';
import 'widget/widgets.dart';
import 'blocs/blocs.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  static Route route(Product product) {
    return MaterialPageRoute(
      builder: (_) => ProductDetailsScreen(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductColorBloc(initialColor: product.productColors[0]),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: min(500, MediaQuery.of(context).size.height * 0.55),
                  child: ProductImagesPreview(imagesUrls: product.imagesUrls),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      children: [
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          product.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: SilverAppColors.giratina500),
                        ),
                        const SizedBox(height: 18.0),
                        SizedBox(
                          height: 40.0,
                          child:
                              BlocBuilder<ProductColorBloc, ProductColorState>(
                            builder: (ctx, state) {
                              return ProductColorSelector(
                                selectedColor: state.selectedColor,
                                productColors: product.productColors,
                                onColorSelected: (color) =>
                                    BlocProvider.of<ProductColorBloc>(ctx).add(
                                        SetSelectedColorEvent(color: color)),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        AppButton(
                          actionText: 'Add to bag',
                          icon: SvgPicture.asset('assets/images/bag.svg'),
                          action: () => BlocProvider.of<BagBloc>(context)
                              .add(AddProductToBagEvent(product: product)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 16,
                left: 16,
              ),
              child: _TopBar(product: product),
            )
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
