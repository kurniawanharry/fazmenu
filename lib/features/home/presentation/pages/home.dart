import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/domain/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class Home extends GetView<MainDrawerController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: 0,
      mainScreenTapClose: true,
      menuBackgroundColor: FazColors.blue[400]!,
      menuScreenOverlayColor: FazColors.cyan,
      controller: controller.zoomDrawerController.value,
      menuScreen: Builder(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(_),
              _body(_),
              _logout(context),
            ],
          );
        },
      ),
      mainScreen: Obx(() => controller.getActivePage(controller.navigationPanel.value)),
    );
  }

  Widget _header(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                onPressed: () {
                  ZoomDrawer.of(context)!.close();
                },
                icon: SvgPicture.asset(
                  'assets/icons/svg/close.svg',
                  color: FazColors.slate[600],
                  height: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: CachedNetworkImageProvider(
                      'https://i.pinimg.com/564x/35/20/bb/3520bb45c416038b371f515b9050f3eb.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Starry',
                    style: TextStyle(fontSize: 20, color: FazColors.slate[600]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _body(BuildContext _) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            controller.drawerMenu.length,
            (index) {
              return Obx(
                () => ListTile(
                  selected: controller.navigationPanel == controller.drawerMenu[index]['id'],
                  selectedColor: FazColors.white,
                  splashColor: FazColors.white,
                  leading: Icon(
                    controller.drawerMenu[index]['icon'] as IconData,
                    size: 20,
                  ),
                  title: Text('${controller.drawerMenu[index]['title']}'),
                  onTap: () {
                    controller.updatePanel(controller.drawerMenu[index]['id'] as NavigationPanel);
                    Future.delayed(const Duration(milliseconds: 300)).then((value) {
                      ZoomDrawer.of(_)!.close();
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ListTile _logout(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.logout,
        size: 20,
      ),
      title: const Text('Keluar'),
      onTap: () {
        controller.doLogout(context);
      },
    );
  }
}
