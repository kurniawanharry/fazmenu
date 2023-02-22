import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/domain/controllers/home_controller.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (get) {
        if (size.width > Constants.maxWidth) {
          return SplitViewWidget(
            navigationPanel: NavigationPanel.order,
            widget: Scaffold(
              appBar: AppBar(
                title: const Text('Pesanan'),
              ),
              body: _body(context, get),
            ),
          );
        } else {
          return Scaffold(
            drawer: const HomeDrawer(
              navigationPanel: NavigationPanel.order,
            ),
            appBar: AppBar(
              title: const Text('Pesanan'),
            ),
            body: _body(context, get),
          );
        }
      },
    );
  }

  SafeArea _body(BuildContext context, HomeController get) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.blue[600],
                      indicatorPadding: const EdgeInsets.only(left: 5),
                      labelColor: Colors.blue[600],
                      unselectedLabelColor: Colors.grey[500],
                      unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.blue[600], fontSize: 14, fontWeight: FontWeight.w500),
                      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.blue[600], fontSize: 14, fontWeight: FontWeight.w600),
                      isScrollable: true,
                      onTap: (index) {},
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Tab(
                            text: 'Pesanan Baru',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Tab(
                            text: 'Menyiapkan',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Tab(
                            text: 'Siap',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Tab(
                            text: 'Selesai',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            color: Colors.transparent,
                            height: 50,
                            child: ButtonsTabBar(
                              controller: get.tabController,
                              backgroundColor: Colors.blue[600],
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              unselectedBackgroundColor: Colors.grey[50],
                              unselectedLabelStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w500,
                              ),
                              height: 50,
                              buttonMargin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                              onTap: (value) {},
                              tabs: const [
                                Tab(
                                  text: 'Semua',
                                ),
                                Tab(
                                  text: 'Lunas',
                                ),
                                Tab(
                                  text: 'Belum Lunas',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: get.tabController,
                        children: [
                          ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              Text('Semua'),
                            ],
                          ),
                          Container(
                            child: Text('Lunas'),
                          ),
                          Container(
                            child: Text('Belum Lunas'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(),
                Container(),
                Container(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
