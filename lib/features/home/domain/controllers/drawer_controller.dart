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
          'id': 0,
          'icon': Icons.home,
          'title': 'Pesanan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/home');
          },
        },
        {
          'id': 1,
          'icon': Icons.history,
          'title': 'Riwayat Pesanan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/history');
          },
        },
        {
          'id': 2,
          'icon': Icons.add_box,
          'title': 'Produk',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/product');
          },
        },
        {
          'id': 3,
          'icon': Icons.category,
          'title': 'Kategori',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': 4,
          'icon': Icons.discount,
          'title': 'Diskon',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': 5,
          'icon': Icons.add,
          'title': 'Tambahan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/addition');
          },
        },
        {
          'id': 6,
          'icon': Icons.analytics,
          'title': 'Analitik',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': 7,
          'icon': Icons.payment,
          'title': 'Pembayaran',
          'quantity': 1,
          'callBack': () {},
        },
        {
          'id': 8,
          'icon': Icons.settings,
          'title': 'Pengaturan',
          'quantity': 1,
          'callBack': () {
            Get.offNamed('/settings');
          },
        },
      ];
}
