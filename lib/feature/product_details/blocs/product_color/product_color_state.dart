part of 'product_color_bloc.dart';

class ProductColorState extends Equatable {
  const ProductColorState(
    this.selectedColor,
  );

  final ProductColor selectedColor;

  @override
  List<Object> get props => [selectedColor];
}
