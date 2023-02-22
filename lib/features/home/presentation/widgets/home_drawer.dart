import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/features/home/domain/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainDrawerController>(
        init: MainDrawerController(),
        builder: (get) {
          return Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        splashRadius: 16,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.clear),
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
                  child: ListView(
                    children: [
                      ...List.generate(get.drawerMenu.length, (index) {
                        return ListTile(
                          leading: Icon(
                            get.drawerMenu[index]['icon'] as IconData,
                            size: 20,
                          ),
                          title: Text('${get.drawerMenu[index]['title']}'),
                          onTap: get.drawerMenu[index]['callBack'] as Function(),
                        );
                      })
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  title: Text('Keluar'),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
