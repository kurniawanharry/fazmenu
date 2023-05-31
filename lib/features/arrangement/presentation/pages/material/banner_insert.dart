import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class BannerInsert extends StatelessWidget {
  const BannerInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Banner'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: AspectRatio(
                      aspectRatio: 5 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FazColors.slate[200],
                            border: Border.all(width: 1, color: FazColors.slate[400]!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Klik untuk masukan banner',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                    child: Column(
                      children: const [
                        TitleListTile(
                          title: 'Tambah Link',
                          subTitle:
                              'Apabila anda membutuhkan banner yang dapat diklik ke Halaman Produk atau Kategori, harap masukan link disini.',
                        ),
                        SingleLineField(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
