import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_market/core/blocs/blocs.dart';
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
                return Expanded(
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
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
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
                            ),
                          ),
                        ),
                      ),
                      // Build the rest of the screen items like promo code...
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
