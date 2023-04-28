import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_mode/home_mode_bloc.dart';
import '../widget/widgets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        BlocProvider.of<HomeModeBloc>(context).state as SelectingCategory;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: state.categories
                  .map((category) => CategoryItem(category: category))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
