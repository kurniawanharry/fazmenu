import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoverBanner extends StatelessWidget {
  const CoverBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Promosi'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Banner',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Visibility(
                    visible: 1 != 0,
                    replacement: Text(
                      'Unggah',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: FazColors.blue[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('2'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ListView.builder(
                    itemCount: Constants.bannerDummy.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      int quantity = index + 1;
                      var image = Constants.bannerDummy[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'No. $quantity',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Hapus',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AspectRatio(
                              aspectRatio: 4 / 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: ImageUrl(
                                  url: image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            minVerticalPadding: 0,
                            visualDensity:
                                const VisualDensity(vertical: VisualDensity.minimumDensity),
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              'Tidak ada',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        Get.toNamed('/bannerInsert');
                      },
                      child: const Text('Tambah'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Simpan'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/bannerPreview');
                    },
                    child: const Text('Pratinjau'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
