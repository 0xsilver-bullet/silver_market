import 'package:equatable/equatable.dart';

import 'package:silver_market/core/model/models.dart';

class BagItem extends Equatable {
  const BagItem({
    required this.product,
    required this.productColor,
    this.count = 1,
  });

  final Product product;
  final ProductColor productColor;
  final int count;

  BagItem copy({
    int? count,
    ProductColor? productColor,
  }) {
    return BagItem(
      product: product,
      productColor: productColor ?? this.productColor,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [product, count];
}
