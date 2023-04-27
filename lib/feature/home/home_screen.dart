import 'package:flutter/material.dart';
import 'package:silver_market/feature/home/utils/non_glowing_scroll_behavior.dart';

import 'page/pages.dart';
import 'widget/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPageIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottomNavBar(
        selectedIndex: _currentPageIndex,
        onDestSelected: _navigateToDest,
      ),
      body: ScrollConfiguration(
        behavior: NonGlowingScrollBehavior(),
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: const [
            HomePage(),
            BagPage(),
            SavedPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() => _currentPageIndex = pageIndex);
  }

  void _navigateToDest(int destIndex) {
    if (_currentPageIndex == destIndex) {
      return;
    }
    if ((_currentPageIndex - destIndex).abs() > 1) {
      // this is to prevent passing through the in between destinations because
      // this will cause bad looking to the bottom nav bar, we should just jump.
      _pageController.jumpToPage(destIndex);
      return;
    }
    _pageController.animateToPage(
      destIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }
}
