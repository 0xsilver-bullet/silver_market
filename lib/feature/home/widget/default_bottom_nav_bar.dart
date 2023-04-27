import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:silver_market/theme.dart';

class DefaultBottomNavBar extends StatelessWidget {
  const DefaultBottomNavBar({
    Key? key,
    this.selectedIndex,
    this.onDestSelected,
  }) : super(key: key);

  final int? selectedIndex;
  final ValueChanged<int>? onDestSelected;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: SvgPicture.asset(
              'assets/images/logo.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? Colors.black : SilverAppColors.giratina400,
                BlendMode.srcIn,
              ),
            ),
            onClick: () => onDestSelected?.call(0),
          ),
          _NavItem(
            icon: SvgPicture.asset(
              'assets/images/bag.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? Colors.black : SilverAppColors.giratina400,
                BlendMode.srcIn,
              ),
            ),
            onClick: () => onDestSelected?.call(1),
          ),
          _NavItem(
            icon: SvgPicture.asset(
              'assets/images/heart.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? Colors.black : SilverAppColors.giratina400,
                BlendMode.srcIn,
              ),
            ),
            onClick: () => onDestSelected?.call(2),
          ),
          _NavItem(
            icon: SvgPicture.asset(
              'assets/images/user.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? Colors.black : SilverAppColors.giratina400,
                BlendMode.srcIn,
              ),
            ),
            onClick: () => onDestSelected?.call(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    Key? key,
    required this.icon,
    this.onClick,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20.0,
      onPressed: onClick,
      icon: icon,
    );
  }
}
