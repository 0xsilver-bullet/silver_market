import 'package:equatable/equatable.dart';

import 'models.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.imagesUrls,
    required this.description,
    required this.productColors,
    required this.price,
    this.discount,
    required this.isNew,
    required this.isFavorite,
  });

  final int id;
  final List<String> imagesUrls;
  final String description;
  final List<ProductColor> productColors;
  final double price;
  final int? discount; // 0 : 100
  final bool isNew;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        imagesUrls,
        description,
        productColors,
        price,
        discount,
        isNew,
        isFavorite,
      ];
}
