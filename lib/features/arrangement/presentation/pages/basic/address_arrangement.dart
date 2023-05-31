
import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressArrangement extends StatelessWidget {
  const AddressArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Pengambilan'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const TitleListTile(
                    icon: Icons.book_outlined,
                    title: 'Nama Alamat',
                    isNeeded: true,
                  ),
                  SingleLineField(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const TitleListTile(
                    icon: Icons.book_outlined,
                    title: 'Kecamatan',
                    isNeeded: true,
                  ),
                  SingleLineField(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const TitleListTile(
                    icon: Icons.book_outlined,
                    title: 'Kelurahan',
                    isNeeded: true,
                  ),
                  SingleLineField(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const TitleListTile(
                    icon: Icons.book_outlined,
                    title: 'Kode Pos',
                    isNeeded: true,
                  ),
                  SingleLineField(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const TitleListTile(
                    icon: Icons.book_outlined,
                    title: 'No. Telepon Toko',
                    isNeeded: true,
                  ),
                  SingleLineField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('62', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIconConstraints: const BoxConstraints(minWidth: 35, maxWidth: 40),
                    prefixTextStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  TitleListTile(
                    icon: Icons.map_outlined,
                    title: 'Pin Lokasi',
                    isNeeded: true,
                    trailing: ButtonEdit(
                      onTap: () {},
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5, color: FazColors.slate[400]!),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 2 / 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ImageUrl(
                              url:
                                  'https://1.bp.blogspot.com/-JsUIdBOuxzs/YC8FJu5l_GI/AAAAAAAAKdE/NQ2GVzroxhUK06Jzzq8p3xFRrz5oiF9bwCNcBGAsYHQ/s640/google%2Bmaps%2Bmemuat.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const TitleListTile(
                    icon: Icons.map_outlined,
                    title: 'Detil Lokasi',
                    isNeeded: true,
                  ),
                  SingleLineField(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
