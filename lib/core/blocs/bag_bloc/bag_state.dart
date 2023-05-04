part of 'bag_bloc.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object?> get props => [];
}

class EmptyBag extends BagState {}

/// indicates that user have items in his bag
class HasOrder extends BagState {
  const HasOrder({
    required this.bag,
    required this.finalTotal,
    this.promoCode,
  });

  final Bag bag;
  final PromoCode? promoCode;

  /// Unlike bag total which is the total cost for all bag items including item count,
  /// this total takes into consideration the promo code and this total is what user
  /// is going to pay.
  final double finalTotal;

  HasOrder copyWith({
    Bag? bag,
    PromoCode? promoCode,
    double? finalTotal,
  }) {
    return HasOrder(
      bag: bag ?? this.bag,
      promoCode: promoCode ?? this.promoCode,
      finalTotal: finalTotal ?? this.finalTotal,
    );
  }

  @override
  List<Object?> get props => [
        bag,
        promoCode,
        finalTotal,
      ];
}
