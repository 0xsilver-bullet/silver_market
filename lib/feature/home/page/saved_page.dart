import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import '../widget/widgets.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({
    Key? key,
    this.action,
  }) : super(key: key);

  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saved items',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<SavedBloc, SavedState>(
            builder: (context, state) {
              if (state is Empty) {
                return Expanded(
                  child: ScreenMessage(
                    title: 'Nothing saved',
                    subTitle:
                        'No Worries ! Start marking as favorite as you shop by clicking on the little heart',
                    actionText: 'Start Shopping',
                    action: action,
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
