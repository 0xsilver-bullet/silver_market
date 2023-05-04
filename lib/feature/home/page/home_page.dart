import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_market/theme.dart';
import '../blocs/home_mode/home_mode_bloc.dart';
import '../widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (BlocProvider.of<HomeModeBloc>(context).state
            is! SelectingPartition) {
          // Then user is at the root of the screen
          BlocProvider.of<HomeModeBloc>(context).add(MoveBackEvent());
          return false;
        }
        return true;
      },
      child: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            'Silver Market',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: DefaultInputField(
              hint: 'Search',
              prefixIcon: const Icon(
                Icons.search,
                color: SilverAppColors.giratina500,
              ),
            ),
          ),
          BlocBuilder<HomeModeBloc, HomeModeState>(
            builder: (ctx, state) {
              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: _getHomePageMainWidget(state),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _getHomePageMainWidget(HomeModeState state) {
    if (state is SelectingPartition) {
      return const StoriesAndHomeParts();
    } else if (state is SelectingCategory) {
      return const CategoriesList();
    } else if (state is SelectedCategory) {
      return const CategoryProducts();
    } else {
      return const Center(
        child: Text('Unexpected Error'),
      );
    }
  }
}
