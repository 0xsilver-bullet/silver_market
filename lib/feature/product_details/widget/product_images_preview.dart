import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:silver_market/theme.dart';

class ProductImagesPreview extends StatefulWidget {
  const ProductImagesPreview({
    Key? key,
    required this.imagesUrls,
  }) : super(key: key);

  final List<String> imagesUrls;

  @override
  State<ProductImagesPreview> createState() => _ProductImagesPreviewState();
}

class _ProductImagesPreviewState extends State<ProductImagesPreview> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: _pageController,
          children: widget.imagesUrls
              .map(
                (url) => CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
        if (widget.imagesUrls.length > 1)
          Positioned(
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.imagesUrls.length,
                effect: const WormEffect(
                  dotHeight: 5,
                  dotWidth: 5,
                  type: WormType.thinUnderground,
                  activeDotColor: Colors.black,
                  dotColor: SilverAppColors.giratina300,
                ),
              ),
            ),
          )
      ],
    );
  }
}
