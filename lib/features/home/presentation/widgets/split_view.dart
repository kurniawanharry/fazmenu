import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class SplitViewWidget extends StatelessWidget {
  const SplitViewWidget({
    super.key,
    this.widget,
    this.navigationPanel,
  });
  final Widget? widget;
  final NavigationPanel? navigationPanel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Constants.drawerWidth,
          child: HomeDrawer(navigationPanel: navigationPanel),
        ),
        Expanded(child: widget!),
      ],
    );
  }
}
