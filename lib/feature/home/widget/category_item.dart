import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_market/core/model/models.dart';
import '../blocs/home_mode/home_mode_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => BlocProvider.of<HomeModeBloc>(context)
            .add(SelectCategoryEvent(category)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: CachedNetworkImageProvider(category.imageUrl),
            ),
            const SizedBox(width: 16),
            Text(
              category.name,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
