import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silver_market/core/widget/widgets.dart';

import 'package:silver_market/theme.dart';

class ScreenMessage extends StatelessWidget {
  const ScreenMessage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.actionText,
    this.action,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String actionText;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          SvgPicture.asset('assets/images/surprised.svg'),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: SilverAppColors.giratina500),
            textAlign: TextAlign.center,
          ),
          const Expanded(child: SizedBox()),
          AppButton(actionText: actionText, action: action),
        ],
      ),
    );
  }
}
