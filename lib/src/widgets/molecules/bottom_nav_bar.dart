import 'package:easy_localization/easy_localization.dart' show tr;

import 'package:flutter/foundation.dart'
    show Key, TargetPlatform, defaultTargetPlatform;
import 'package:flutter/material.dart'
    show
        BottomNavigationBar,
        BuildContext,
        ClipRRect,
        Colors,
        EdgeInsets,
        Icons,
        Key,
        Padding,
        PageController,
        State,
        StatefulWidget,
        TargetPlatform,
        Widget;
import 'package:flutter/widgets.dart';

import '../../config/themes/colors.dart';
import '../../pages/home_pages/home_navigator.dart';

class BottomNavBar extends StatefulWidget {
  final PageController tabController;

  const BottomNavBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  @override
  initState() {
    widget.tabController.addListener(() {
      setState(() {
        currentIndex = (widget.tabController.page ?? 0).toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Padding(
        padding: defaultTargetPlatform == TargetPlatform.iOS
            ? const EdgeInsets.only(top: 16)
            : const EdgeInsets.symmetric(vertical: 16),
        child: BottomNavigationBar(
          backgroundColor: Colors.black87,
          currentIndex: currentIndex,
          onTap: (value) {
            widget.tabController.jumpToPage(value);
            goBack();
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                currentIndex == 0 ? Icons.home : Icons.home_outlined,
                color: AppColors.white,
                size: 30,
              ),
              label: tr(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                currentIndex == 1 ? Icons.people_rounded : Icons.people_outline,
                color: AppColors.white,
                size: 30,
              ),
              label: tr(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                currentIndex == 2 ? Icons.person : Icons.person_outline,
                color: AppColors.white,
                size: 30,
              ),
              label: tr(""),
            ),
          ],
        ),
      ),
    );
  }
}
