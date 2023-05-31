import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashRadius: 15,
        onPressed: () {
          ZoomDrawer.of(context)!.open();
        },
        icon: const Icon(Icons.menu));
  }
}
