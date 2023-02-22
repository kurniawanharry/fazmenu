import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawerController extends GetxController {
  late BuildContext context;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  List<Map<String, Object>> get drawerMenu => [
        {
          'id': NavigationPanel.order,
          'icon': Icons.home,
          'title': 'Pesanan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/home');
          },
        },
        {
          'id': NavigationPanel.history,
          'icon': Icons.history,
          'title': 'Riwayat Pesanan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/history');
          },
        },
        {
          'id': NavigationPanel.product,
          'icon': Icons.add_box,
          'title': 'Produk',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/product');
          },
        },
        {
          'id': NavigationPanel.category,
          'icon': Icons.category,
          'title': 'Kategori',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': NavigationPanel.discount,
          'icon': Icons.discount,
          'title': 'Diskon',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': NavigationPanel.addition,
          'icon': Icons.add,
          'title': 'Tambahan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/addition');
          },
        },
        {
          'id': NavigationPanel.analytics,
          'icon': Icons.analytics,
          'title': 'Analitik',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': NavigationPanel.payment,
          'icon': Icons.payment,
          'title': 'Pembayaran',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': NavigationPanel.settings,
          'icon': Icons.settings,
          'title': 'Pengaturan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/settings');
          },
        },
      ];
}
