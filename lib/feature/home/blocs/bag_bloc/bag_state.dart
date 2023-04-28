part of 'bag_bloc.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object> get props => [];
}

class EmptyBag extends BagState {}
