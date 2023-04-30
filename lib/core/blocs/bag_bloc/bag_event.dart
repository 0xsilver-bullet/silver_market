part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class AddProductToBagEvent extends BagEvent {
  const AddProductToBagEvent({
    required this.product,
  });
  final Product product;

  @override
  List<Object> get props => [product];
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

class RemoveFromBagEvent extends BagEvent {
  const RemoveFromBagEvent({
    required this.product,
  });
  final Product product;

  @override
  List<Object> get props => [product];
}
