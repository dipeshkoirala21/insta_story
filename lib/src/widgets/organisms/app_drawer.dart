import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxConstraints,
        BuildContext,
        ClipRRect,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        Divider,
        Drawer,
        EdgeInsets,
        Expanded,
        Icon,
        Icons,
        Key,
        ListView,
        Navigator,
        Padding,
        Radius,
        Row,
        SafeArea,
        Size,
        SizedBox,
        StatelessWidget,
        TargetPlatform,
        Text,
        Theme,
        Widget;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart' show Consumer;
import 'package:sizer/sizer.dart' show SizerUtil;

import '../../config/firebase/auth.dart';
import '../../config/themes/colors.dart';
// import '../../pages/auth/update/profile.dart';
import '../../pages/home.dart';
// import '../../pages/inquiry.dart';
import '../../providers/auth_provider.dart';
import '../atoms/button.dart';
import '../atoms/drawer_items.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: defaultTargetPlatform != TargetPlatform.iOS,
      child: ClipRRect(
        borderRadius:
            const BorderRadius.horizontal(right: Radius.circular(32.0)),
        child: Container(
          constraints: BoxConstraints.tight(
              Size(SizerUtil.width - 72, SizerUtil.height)),
          child: Drawer(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      children: const <Widget>[
                        DrawerDefaultMenu(),
                      ],
                    ),
                  ),
                  const DrawerFooter()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerDefaultMenu extends StatelessWidget {
  const DrawerDefaultMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(
          svgIcon: SvgPicture.asset(
            "assets/icons/question.svg",
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          title: "Health & Medicine",
          onTap: () {},
        ),
        DrawerItem(
          svgIcon: SvgPicture.asset(
            "assets/icons/question.svg",
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          title: "Fashion & Beauty",
          onTap: () {},
        ),
        DrawerItem(
          svgIcon: SvgPicture.asset(
            "assets/icons/question.svg",
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          title: "Art & Photography",
          onTap: () {},
        ),
        DrawerItem(
          svgIcon: SvgPicture.asset(
            "assets/icons/question.svg",
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          title: "Sports",
          onTap: () {
            Navigator.pushNamed(context, "audience_view");
          },
        ),
      ],
    );
  }
}

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultTargetPlatform == TargetPlatform.iOS
          ? const EdgeInsets.only(top: 16, left: 24, right: 24)
          : const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Button(
            type: ButtonType.filled,
            onPressed: () {},
            label: 'Next',
            disableBorder: true,
          ),
        ],
      ),
    );
  }
}
