import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        IconButton,
        Key,
        MaterialLocalizations,
        PreferredSizeWidget,
        Scaffold,
        StatelessWidget,
        Widget;
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      centerTitle: false,
      title: Image.asset(
        'assets/images/logo.png',
        height: 50.0,
        fit: BoxFit.contain,
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
      actionsIconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
