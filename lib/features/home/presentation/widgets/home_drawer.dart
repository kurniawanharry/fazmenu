import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/components/button/button_exit.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/domain/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    this.navigationPanel,
  });

  final NavigationPanel? navigationPanel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<MainDrawerController>(
      init: MainDrawerController(),
      builder: (get) {
        return Drawer(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 150,
                decoration: BoxDecoration(
                    color: FazColors.blue[600],
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: size.width < 600,
                      child: const ButtonExit(color: FazColors.white),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                'Nijika',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      get.drawerMenu.length,
                      (index) {
                        return ListTile(
                          selected: navigationPanel == get.drawerMenu[index]['id'],
                          leading: Icon(
                            get.drawerMenu[index]['icon'] as IconData,
                            size: 20,
                          ),
                          title: Text('${get.drawerMenu[index]['title']}'),
                          onTap: get.drawerMenu[index]['callBack'] as Function(),
                        );
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
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
