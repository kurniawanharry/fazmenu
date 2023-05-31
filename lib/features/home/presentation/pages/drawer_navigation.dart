import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/components/button/button_exit.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/home/domain/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerNavigation extends GetView<MainDrawerController> {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(size),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  controller.drawerMenu.length,
                  (index) {
                    return Obx(() => ListTile(
                          selected: controller.navigationPanel.value ==
                              controller.drawerMenu[index]['id'],
                          leading: Icon(
                            controller.drawerMenu[index]['icon'] as IconData,
                            size: 20,
                          ),
                          title: Text('${controller.drawerMenu[index]['title']}'),
                          onTap: controller.drawerMenu[index]['callBack'] as Function(),
                        ));
                  },
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 20,
            ),
            title: const Text('Keluar'),
            onTap: () {
              controller.doLogout(context);
            },
          ),
        ],
      ),
    );
  }

  Container _header(Size size) {
    return Container(
      margin: EdgeInsets.zero,
      height: 200,
      decoration: BoxDecoration(
        color: FazColors.blue[600],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: size.width < 600,
              child: const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: ButtonExit(color: FazColors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                          'https://i.pinimg.com/564x/35/20/bb/3520bb45c416038b371f515b9050f3eb.jpg'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Starry',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
