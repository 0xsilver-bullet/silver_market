part of 'product_color_bloc.dart';

abstract class ProductColorEvent extends Equatable {
  const ProductColorEvent();

  @override
  List<Object> get props => [];
}

class SetSelectedColorEvent extends ProductColorEvent {
  const SetSelectedColorEvent({
    required this.color,
  });
  final ProductColor color;

  @override
  List<Object> get props => [color];
}
