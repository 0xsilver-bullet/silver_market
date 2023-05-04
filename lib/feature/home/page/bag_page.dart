import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_market/core/blocs/blocs.dart';
import 'package:silver_market/core/widget/widgets.dart';
import 'package:silver_market/feature/checkout/checkout_screen.dart';
import '../widget/widgets.dart';

class BagPage extends StatelessWidget {
  const BagPage({
    Key? key,
    this.onEmptyBagCallback,
  }) : super(key: key);

  final VoidCallback? onEmptyBagCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bag',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<BagBloc, BagState>(
              builder: (context, state) {
                if (state is EmptyBag) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height -
                        192, // TODO: You migh need to change this because it will not look good on all screens I think
                    child: ScreenMessage(
                      title: 'Your bag is empty',
                      subTitle:
                          'items remain in your bag for 1 hour, and then they\'re moved to your Saved items',
                      actionText: 'Start Shopping',
                      action: onEmptyBagCallback,
                    ),
                  );
                } else {
                  final bag = (state as HasOrder).bag;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 8),
                          itemCount: bag.bagItems.length,
                          itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.only(bottom: 18.0),
                            child: ProductCard(
                              product: bag.bagItems[index].product,
                              onClear: () =>
                                  BlocProvider.of<BagBloc>(context).add(
                                RemoveFromBagEvent(
                                    product: bag.bagItems[index].product),
                              ),
                              actionWidget: BagItemCounter(
                                count: bag.bagItems[index].count,
                                onDec: () =>
                                    BlocProvider.of<BagBloc>(context).add(
                                  DecProductCountEvent(
                                      product: bag.bagItems[index].product),
                                ),
                                onInc: () =>
                                    BlocProvider.of<BagBloc>(context).add(
                                  IncProductCountEvent(
                                      product: bag.bagItems[index].product),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Promocode',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const DefaultInputField(hint: 'code'),
                      const SizedBox(height: 24.0),
                      BlocBuilder<BagBloc, BagState>(
                        builder: (ctx, state) {
                          if (state is EmptyBag) {
                            return const CircularProgressIndicator();
                          } else {
                            final order = state as HasOrder;
                            return BagInfo(
                              bag: order.bag,
                              finalTotal: order.finalTotal,
                              descount: order.promoCode != null
                                  ? order.bag.total - order.finalTotal
                                  : null,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 18.0),
                      AppButton(
                        actionText: 'Checkout',
                        action: () =>
                            Navigator.of(context).push(CheckoutScreen.route),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
