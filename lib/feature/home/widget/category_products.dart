import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silver_market/feature/home/widget/widgets.dart';
import 'package:silver_market/theme.dart';

import '../blocs/home_mode/home_mode_bloc.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _CustomButton(
                  text: 'Sort',
                  icon: SvgPicture.asset('assets/images/sort_icon.svg'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _CustomButton(
                  text: 'Filter',
                  icon: SvgPicture.asset('assets/images/filter.svg'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          BlocBuilder<HomeModeBloc, HomeModeState>(
            builder: (context, state) {
              final products = (state as SelectedCategory).products;
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    return ProductItem(
                      product: products[index],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(
      {Key? key, required this.text, required this.icon, this.onClick})
      : super(key: key);

  final String text;
  final Widget icon;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: SilverAppColors.giratina100,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(width: 4.0),
            icon
          ],
        ),
      ),
    );
  }
}
