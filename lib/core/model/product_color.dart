import 'package:equatable/equatable.dart';

class ProductColor extends Equatable {
  const ProductColor({
    required this.name,
    required this.value,
  });

  final String name;
  final int value;

  @override
  List<Object> get props => [name, value];
}
