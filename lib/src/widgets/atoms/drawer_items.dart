import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart'
    show
        BuildContext,
        EdgeInsets,
        GestureTapCallback,
        Key,
        ListTile,
        Navigator,
        State,
        StatefulWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_svg/svg.dart';

import '../../config/themes/colors.dart';

class DrawerItem extends StatefulWidget {
  final SvgPicture svgIcon;
  final String title;
  final GestureTapCallback? onTap;

  const DrawerItem({
    Key? key,
    required this.svgIcon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        widget.onTap!();
      },
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      leading: widget.svgIcon,
      title: Text(
        tr(widget.title),
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: AppColors.black),
      ),
    );
  }
}
