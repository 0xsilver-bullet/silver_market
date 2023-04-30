part of 'bag_bloc.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object> get props => [];
}

class EmptyBag extends BagState {}

/// indicates that user have items in his bag
class HasOrder extends BagState {
  const HasOrder(this.bag);

  final Bag bag;

  @override
  List<Object> get props => [bag];
}
