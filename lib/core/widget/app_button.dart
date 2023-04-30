import 'package:flutter/material.dart';

import '../../theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.actionText,
    this.icon,
    required this.action,
  }) : super(key: key);

  final String actionText;
  final Widget? icon;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: SilverAppColors.yellow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              actionText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (icon != null) ...[const SizedBox(width: 8), icon!]
          ],
        ),
      ),
    );
  }
}
