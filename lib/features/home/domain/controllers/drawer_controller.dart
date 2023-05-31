import 'package:fazmenu/core/components/loading/loady.dart';
import 'package:fazmenu/core/services/storage_remote.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/addition/presentation/pages/addition_screen.dart';
import 'package:fazmenu/features/analytic/presentation/pages/analytic_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/arrangement_screen.dart';
import 'package:fazmenu/features/category/presentation/pages/category_screen.dart';
import 'package:fazmenu/features/discount/presentation/pages/discount_screen.dart';
import 'package:fazmenu/features/orderHistory/presentation/pages/order_history.dart';
import 'package:fazmenu/features/order/presentation/pages/order_screen.dart';
import 'package:fazmenu/features/payment/presentation/pages/history_payment.dart';
import 'package:fazmenu/features/product/presentation/pages/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MainDrawerController extends GetxController {
  Rx<ZoomDrawerController> zoomDrawerController = ZoomDrawerController().obs;

  Rx<NavigationPanel> navigationPanel = NavigationPanel.order.obs;

  doLogout(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Loady(
          progressIndicatorType: ProgressIndicatorType.threeBounce,
        );
      },
    );
    resetStorage();
    Get.back();
    Get.offAllNamed('/splash');
  }

  List<Map<String, Object>> get drawerMenu {
    return [
      {
        'id': NavigationPanel.order,
        'icon': Icons.home,
        'title': 'Pesanan',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.order);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/order');
        },
      },
      {
        'id': NavigationPanel.history,
        'icon': Icons.history,
        'title': 'Riwayat Pesanan',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.history);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/history');
        },
      },
      {
        'id': NavigationPanel.product,
        'icon': Icons.add_box,
        'title': 'Produk',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.product);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/product');
        },
      },
      {
        'id': NavigationPanel.category,
        'icon': Icons.category,
        'title': 'Kategori',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.category);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/category');
        },
      },
      {
        'id': NavigationPanel.discount,
        'icon': Icons.discount,
        'title': 'Diskon',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.discount);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/discount');
        }
      },
      {
        'id': NavigationPanel.addition,
        'icon': Icons.add,
        'title': 'Tambahan',
        'quantity': 1,
        'callBack': () async {
          updatePanel(NavigationPanel.addition);
          Get.back();
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/addition');
        },
      },
      {
        'id': NavigationPanel.analytics,
        'icon': Icons.analytics,
        'title': 'Analitik',
        'quantity': 1,
        'callBack': () async {
          updatePanel(NavigationPanel.analytics);
          Get.back();
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/analytic');
        },
      },
      {
        'id': NavigationPanel.payment,
        'icon': Icons.payment,
        'title': 'Pembayaran',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.payment);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/historyPayment');
        },
      },
      {
        'id': NavigationPanel.settings,
        'icon': Icons.settings,
        'title': 'Pengaturan',
        'quantity': 1,
        'callBack': () async {
          Get.back();
          updatePanel(NavigationPanel.settings);
          await Future.delayed(const Duration(milliseconds: 150));
          Get.offNamed('/settings');
        },
      },
    ];
  }

  ///
  updatePanel(NavigationPanel? value) {
    navigationPanel.value = value!;
  }

  Widget getActivePage(NavigationPanel panel) {
    switch (panel) {
      case NavigationPanel.order:
        return const OrderScreen();
      case NavigationPanel.history:
        return const OrderHistory();
      case NavigationPanel.product:
        return const ProductScreen();
      case NavigationPanel.category:
        return const CategoryScreen();
      case NavigationPanel.discount:
        return const DiscountScreen();
      case NavigationPanel.addition:
        return const AdditionScreen();
      case NavigationPanel.analytics:
        return const AnalyticScreen();
      case NavigationPanel.payment:
        return const HistoryPayment();
      case NavigationPanel.settings:
        return const ArrangementScreen();
      default:
    }
    return const OrderScreen();
  }
}
