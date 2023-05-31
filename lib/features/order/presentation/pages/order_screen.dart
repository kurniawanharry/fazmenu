import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/button/button_search.dart';
import 'package:fazmenu/core/components/text_field/search_text_field.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/order/domain/controllers/order_controller.dart';
import 'package:fazmenu/features/order/presentation/widgets/order_card_widget.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:fazmenu/features/order/presentation/widgets/tab_quantity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget with PreferredSizeWidget {
  const OrderScreen({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        widget: Scaffold(
          appBar: _appBar(context),
          body: _body(context),
        ),
      );
    } else {
      return Scaffold(
        drawer: null,
        appBar: _appBar(context),
        body: _body(context),
      );
    }
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: GetBuilder<OrderController>(
        init: Get.find<OrderController>(),
        builder: (get) {
          return AppBar(
            title: get.isSearching ? const SearchTextField() : const Text('Pesanan'),
            leading: const ButtonMenu(),
            actions: [
              ButtonSearch(
                isClick: get.isSearching,
                size: 30,
                onTap: get.toggleSearching,
              )
            ],
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (get) {
        return SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(
                    'Izinkan tampil di depan',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: FazColors.blue[600],
                        ),
                  ),
                  tileColor: FazColors.blue[100],
                  trailing: TextButton(onPressed: () {}, child: const Text('Pengaturan')),
                ),
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
                          indicatorColor: FazColors.blue[600],
                          indicatorPadding: const EdgeInsets.only(left: 5),
                          labelColor: FazColors.blue[600],
                          unselectedLabelColor: FazColors.gray[500],
                          unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: FazColors.blue[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: FazColors.blue[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          isScrollable: true,
                          onTap: (index) {},
                          tabs: const [
                            TabQuantity(
                              title: 'Pesanan Baru',
                              quantity: 1,
                            ),
                            TabQuantity(
                              title: 'Menyiapkan',
                              quantity: 0,
                            ),
                            TabQuantity(
                              title: 'Siap',
                              quantity: 0,
                            ),
                            TabQuantity(
                              title: 'Selesai',
                              quantity: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
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
                                    backgroundColor: FazColors.blue[600],
                                    labelStyle: const TextStyle(
                                      color: FazColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    unselectedBackgroundColor: FazColors.gray[50],
                                    unselectedLabelStyle: TextStyle(
                                      color: FazColors.gray[400],
                                      fontWeight: FontWeight.w500,
                                    ),
                                    height: 50,
                                    buttonMargin:
                                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
                                    ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return const OrderCardWidget();
                                      },
                                    )
                                  ],
                                ),
                                ListView(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  children: [
                                    ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return const OrderCardWidget();
                                      },
                                    )
                                  ],
                                ),
                                ListView(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  children: [
                                    ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return const OrderCardWidget();
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(),
                      Container(),
                      ListView.builder(
                        itemCount: 2,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              // side: BorderSide(width: 0.5, strokeAlign: 0, color: FazColors.slate[400]!),
                            ),
                            color: FazColors.neutral[50],
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        visualDensity: const VisualDensity(
                                            vertical: VisualDensity.minimumDensity),
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Nomor Telepon Pembeli',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        trailing: const Text('+628212341234'),
                                      ),
                                      ListTile(
                                        visualDensity: const VisualDensity(
                                            vertical: VisualDensity.minimumDensity),
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'ID Pesanan',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        trailing: const Text('050120312301230'),
                                      ),
                                      ListTile(
                                        visualDensity: const VisualDensity(
                                            vertical: VisualDensity.minimumDensity),
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Waktu Pemesanan',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        trailing: const Text('02/03/2023 15:24:58'),
                                      ),
                                      ListTile(
                                        visualDensity: const VisualDensity(
                                            vertical: VisualDensity.minimumDensity),
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Tipe Order',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        trailing: const Text('Makan di Tempat'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: const BoxDecoration(
                                    color: FazColors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          'Sub Total',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        subtitle: Text(
                                          formatCurrency(10000),
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: FazColors.slate[800],
                                              ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Biaya Transaksi',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        subtitle: Text(
                                          formatCurrency(10000),
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: FazColors.slate[800],
                                              ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Pendapatan',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: FazColors.slate[400],
                                              ),
                                        ),
                                        subtitle: Text(
                                          formatCurrency(10000),
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                                color: FazColors.slate[800],
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child: TextButton(
                                          onPressed: () {
                                            Get.toNamed('/orderDetail');
                                          },
                                          child: Text(
                                            'Lihat Detail',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: FazColors.blue[600],
                                                ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
