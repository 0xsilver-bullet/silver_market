import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_market/core/blocs/blocs.dart';
import '../widget/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'account',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is NotAuthenticated) {
                return Expanded(
                  child: ScreenMessage(
                    title: 'Come on in',
                    subTitle: 'View Orders and Update details !',
                    actionText: 'Continue with phone',
                    action: () {},
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
