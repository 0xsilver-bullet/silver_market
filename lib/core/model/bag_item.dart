import 'package:equatable/equatable.dart';

import 'package:silver_market/core/model/models.dart';

class BagItem extends Equatable {
  const BagItem({
    required this.product,
    this.count = 1,
  });

  final Product product;
  final int count;

  BagItem copy({int? count}) {
    return BagItem(
      product: product,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [product, count];
}
