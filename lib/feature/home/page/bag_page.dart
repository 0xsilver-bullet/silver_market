import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widgets.dart';
import '../blocs/blocs.dart';

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
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
