
import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/components/radio/radio_tile_no_border.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/recomendation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendationArrangement extends GetView<RecomendationController> {
  const RecomendationArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomSwitchTile(
                    value: controller.historyMessage.value,
                    title: const Text('Riwayat pesanan'),
                    onChanged: controller.toggleHistory,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              child: Column(
                children: [
                  Text(
                    'Dengan mengaktifkan fitur ini, pembeli mendapatkan rekomendasi pada Halaman Daftar Produk di semua jenis layanan.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  const AspectRatio(
                    aspectRatio: 2 / 1,
                    child: ImageUrl(
                      url:
                          'http://jurnalotaku.com/wp-content/uploads/2023/01/waifuwed-nijika-3-700x394.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomSwitchTile(
                    value: controller.detailMessage.value,
                    title: const Text('Detail produk'),
                    onChanged: controller.toggleDetail,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetX<RecomendationController>(
                    builder: (_) {
                      return Visibility(
                        visible: controller.detailMessage.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih berdasarkan 5 produk terlaris atau pilih manual',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected:
                                          controller.detailRecommend.value == DetailRecommend.auto,
                                      title: '5 Produk terlaris',
                                      onTap: () {
                                        controller.toggleDetailDecommend(DetailRecommend.auto);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected: controller.detailRecommend.value ==
                                          DetailRecommend.manual,
                                      title: 'Pilih Manual',
                                      onTap: () {
                                        controller.toggleDetailDecommend(DetailRecommend.manual);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  GetX<RecomendationController>(
                    builder: (_) {
                      return Visibility(
                        visible: controller.detailRecommend.value == DetailRecommend.auto,
                        replacement: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Makan di Tempat',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                  ),
                                  Visibility(
                                    visible: true,
                                    replacement: TextButton(
                                      onPressed: () {},
                                      child: const Text('Pilih Produk'),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    const NoImageProduct(size: 40),
                                                separatorBuilder: (context, index) =>
                                                    const SizedBox(width: 10),
                                                itemCount: 5,
                                              ),
                                            ),
                                            const Icon(Icons.arrow_forward_ios, size: 16)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pesan Antar',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                  ),
                                  Visibility(
                                    visible: true,
                                    replacement: TextButton(
                                      onPressed: () {},
                                      child: const Text('Pilih Produk'),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    const NoImageProduct(size: 40),
                                                separatorBuilder: (context, index) =>
                                                    const SizedBox(width: 10),
                                                itemCount: 2,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ambil di Tempat',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    replacement: TextButton(
                                      onPressed: () {
                                        Get.toNamed('/productSearch');
                                      },
                                      child: const Text('Pilih Produk'),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    const NoImageProduct(size: 40),
                                                separatorBuilder: (context, index) =>
                                                    const SizedBox(width: 10),
                                                itemCount: 2,
                                              ),
                                            ),
                                            const Icon(Icons.arrow_forward_ios, size: 16)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Dengan mengaktifkan fitur ini, pembeli mendapatkan rekomendasi pada Halaman Daftar Produk di semua jenis layanan.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            const AspectRatio(
                              aspectRatio: 2 / 1,
                              child: ImageUrl(
                                url:
                                    'http://jurnalotaku.com/wp-content/uploads/2023/01/waifuwed-nijika-3-700x394.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.detailMessage.value,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Simpan'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomSwitchTile(
                    value: controller.screenMessage.value,
                    title: const Text('Halaman Pesanan'),
                    onChanged: controller.toggleScreen,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetX<RecomendationController>(
                    builder: (_) {
                      return Visibility(
                        visible: controller.screenMessage.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih berdasarkan 5 produk terlaris atau pilih manual',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected:
                                          controller.orderRecommend.value == OrderRecommend.auto,
                                      title: '5 Produk terlaris',
                                      onTap: () {
                                        controller.toggleOrderDecommend(OrderRecommend.auto);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected:
                                          controller.orderRecommend.value == OrderRecommend.manual,
                                      title: 'Pilih Manual',
                                      onTap: () {
                                        controller.toggleOrderDecommend(OrderRecommend.manual);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  GetX<RecomendationController>(
                    builder: (_) {
                      return Visibility(
                        visible: controller.orderRecommend.value == OrderRecommend.auto,
                        replacement: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Makan di Tempat',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                  ),
                                  Visibility(
                                    visible: true,
                                    replacement: TextButton(
                                      onPressed: () {},
                                      child: const Text('Pilih Produk'),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    const NoImageProduct(size: 40),
                                                separatorBuilder: (context, index) =>
                                                    const SizedBox(width: 10),
                                                itemCount: 5,
                                              ),
                                            ),
                                            const Icon(Icons.arrow_forward_ios, size: 16)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pesan Antar',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                  ),
                                  Visibility(
                                    visible: true,
                                    replacement: TextButton(
                                      onPressed: () {},
                                      child: const Text('Pilih Produk'),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    const NoImageProduct(size: 40),
                                                separatorBuilder: (context, index) =>
                                                    const SizedBox(width: 10),
                                                itemCount: 2,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ambil di Tempat',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    replacement: TextButton(
                                      onPressed: () {
                                        Get.toNamed('/productSearch');
                                      },
                                      child: const Text('Pilih Produk'),
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    const NoImageProduct(size: 40),
                                                separatorBuilder: (context, index) =>
                                                    const SizedBox(width: 10),
                                                itemCount: 2,
                                              ),
                                            ),
                                            const Icon(Icons.arrow_forward_ios, size: 16)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Dengan mengaktifkan fitur ini, pembeli mendapatkan rekomendasi pada Halaman Pesan di semua jenis layanan.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            const AspectRatio(
                              aspectRatio: 2 / 1,
                              child: ImageUrl(
                                url:
                                    'http://jurnalotaku.com/wp-content/uploads/2023/01/waifuwed-nijika-3-700x394.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.screenMessage.value,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Simpan'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
          ],
        ),
      ),
    );
  }
}
