import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_market/core/model/models.dart';
import '../blocs/home_mode/home_mode_bloc.dart';
import 'package:silver_market/theme.dart';

class HomePartItem extends StatelessWidget {
  const HomePartItem({
    Key? key,
    required this.homePart,
  }) : super(key: key);

  final HomePart homePart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: SilverAppColors.giratina100,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => BlocProvider.of<HomeModeBloc>(context)
            .add(SelectHomePartEvent(homePart)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                homePart.name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                width: 82.0,
                height: double.infinity,
                imageUrl: homePart.imageUrl,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
