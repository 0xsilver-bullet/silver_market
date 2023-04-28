import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver_market/feature/home/home_screen.dart';
import 'package:silver_market/theme.dart';

import 'package:silver_market/core/blocs/blocs.dart';

class SilverMarketApp extends StatelessWidget {
  const SilverMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Silver Market',
        theme: SilverAppTheme.light,
        darkTheme: SilverAppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
