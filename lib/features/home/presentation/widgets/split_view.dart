import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:flutter/material.dart';

class SplitViewWidget extends StatelessWidget {
  const SplitViewWidget({
    super.key,
    this.widget,
  });
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: Constants.drawerWidth,
          child: DrawerNavigation(),
        ),
        Expanded(child: widget!),
      ],
    );
  }
}
