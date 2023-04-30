import 'package:equatable/equatable.dart';

import 'models.dart';

class Bag extends Equatable {
  const Bag({
    required this.bagItems,
    required this.total,
  });

  final List<BagItem> bagItems;
  final double total; // order total cost

  Bag copy({
    List<BagItem>? bagItems,
    double? total,
  }) {
    return Bag(
      bagItems: bagItems ?? this.bagItems,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [bagItems, total];
}
