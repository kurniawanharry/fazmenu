import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/response_handler/illustration_loader.dart';
import 'package:fazmenu/features/discount/domain/controllers/discount_controller.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DiscountScreen extends GetView<DiscountController> {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diskon'),
        leading: kIsWeb ? null : const ButtonMenu(),
      ),
      drawer: kIsWeb ? const DrawerNavigation() : null,
      body: SafeArea(
        child: Column(
          children: [
            IllustrationLoader(
              imageUrl: 'https://i.pinimg.com/736x/2f/e0/be/2fe0be6cffea490bd1e629b500421c32.jpg',
              height: 200,
              title: 'Diskon',
              description:
                  'Buat, kelola dan bagikan promosi kamu di seluruh saluran penjualan kamu',
              button: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/discountInsert');
                  },
                  child: const Text('Tambah Diskon')),
            ),
          ],
        ),
      ),
    );
  }
}
