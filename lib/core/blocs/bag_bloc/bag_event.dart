part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class AddProductToBagEvent extends BagEvent {
  const AddProductToBagEvent({
    required this.product,
    required this.productColor,
  });
  final Product product;
  final ProductColor productColor;

  @override
  List<Object> get props => [product, productColor];
}

class IncProductCountEvent extends BagEvent {
  const IncProductCountEvent({
    required this.product,
  });
  final Product product;

  @override
  List<Object> get props => [product];
}

class DecProductCountEvent extends BagEvent {
  const DecProductCountEvent({
    required this.product,
  });
  final Product product;

  @override
  List<Object> get props => [product];
}

class SetProductColor extends BagEvent {
  const SetProductColor({required this.productId, required this.productColor});

  final int productId;
  final ProductColor productColor;

  @override
  List<Object> get props => [productId, productColor];
}

class RemoveFromBagEvent extends BagEvent {
  const RemoveFromBagEvent({
    required this.product,
  });
  final Product product;

  @override
  List<Object> get props => [product];
}
