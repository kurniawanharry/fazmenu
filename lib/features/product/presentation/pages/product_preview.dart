import 'package:fazmenu/core/components/checkbox/custom_checkbox_tile.dart';
import 'package:fazmenu/core/components/chip/custom_chip.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/components/radio/radio_tile_no_border.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/arrangement/presentation/widgets/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductPreview extends StatelessWidget {
  const ProductPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const PreviewWidget(
              title: 'Ini adalah pratinjau dari halaman produk kamu',
            ),
            Expanded(
              child: ListView(
                children: [
                  const Visibility(
                    child: NoImageProduct(
                      size: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cinnamon Roll',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Cinnabon adalah sebuah waralaba Amerika Serikat di bidang toko dan kios roti dan kue yang dipanggang, biasanya ditemukan di area-area dengan tingkat kemacetan yang tinggi seperti mal-mal. Makanan yang menjadi logo utama perusahaan adalah kue dadar gulung rasa kayu manis. Pada bulan Juli 2009, lebih dari 750 toko roti Cinnabon beroperasi di lebih 30 negara di dunia. Kantor utamanya terletak di Sandy Springs, Georgia.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                          ),
                        ),
                        Text(
                          formatCurrency(10000),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: false,
                    replacement: Column(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              tileColor: FazColors.slate[200],
                              title: Row(
                                children: [
                                  const Text('Mohon Pilih Varian'),
                                  const SizedBox(width: 10),
                                  CustomChip(
                                    text: 'Wajib',
                                    color: FazColors.red[600],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              color: FazColors.slate[200],
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: ListTile(
                                title: const Text('Chiffon Cake'),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('QTY : 1'),
                                    Text(
                                      'Pilih Varian',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: FazColors.blue,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              tileColor: FazColors.slate[200],
                              title: Row(
                                children: [
                                  const Text('Test opt'),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Pilih sampai dengan 1',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  const CustomCheckboxTile(
                                    value: true,
                                    title: 'Brownies',
                                    subTitle: 'Rp 10',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25, top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              MdiIcons.minusCircle,
                                              size: 20,
                                              color: FazColors.blue,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              child: Text('1'),
                                            ),
                                            Icon(
                                              MdiIcons.plusCircle,
                                              size: 20,
                                              color: FazColors.blue,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Pilih Varian',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                color: FazColors.blue,
                                                fontSize: 12,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              tileColor: FazColors.slate[200],
                              title: Row(
                                children: [
                                  const Text('Affogato Option'),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Pilih sampai dengan 1',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: RadioTileNoBorder(
                                  isSelected: true, title: 'Vanilla', subTitle: 'Rp 10'),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: RadioTileNoBorder(
                                  isSelected: false, title: 'Chocolate', subTitle: 'Rp 10'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              tileColor: FazColors.slate[200],
                              title: Row(
                                children: [
                                  const Text('Kuah/Goreng'),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Pilih sampai dengan 1',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  CustomChip(
                                    text: 'Wajib',
                                    color: FazColors.red[600],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: RadioTileNoBorder(
                                  isSelected: true, title: 'Kuah', subTitle: 'Rp 10'),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: RadioTileNoBorder(
                                  isSelected: false, title: 'Goreng', subTitle: 'Rp 10'),
                            ),
                          ],
                        ),
                      ],
                    ),
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
