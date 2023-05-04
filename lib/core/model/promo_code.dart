import 'package:equatable/equatable.dart';

class PromoCode extends Equatable {
  const PromoCode({
    required this.id,
    this.percent,
    this.descAmount,
    this.maxDescAmount,
  });

  final int id;

  /// if descount is for example 20%
  final double? percent;

  /// if descount by amount like 5$ no matter what is the total price
  final double? descAmount;

  final double? maxDescAmount;

  @override
  List<Object?> get props => [
        id,
        percent,
        descAmount,
        maxDescAmount,
      ];
}
