import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/features/addition/domain/controllers/addition_insert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionInsert extends StatelessWidget {
  const AdditionInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdditionInsertController>(
      init: AdditionInsertController(),
      builder: (get) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tambah Modifikasi'),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            const TitleListTile(
                              title: 'Nama Set Modifikasi',
                              icon: Icons.book_outlined,
                              isNeeded: true,
                            ),
                            SingleLineField(
                              controller: get.modNameController,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            const TitleListTile(
                              title: 'Opsi Tambahan',
                              subTitle: 'Anda perlu menambah minimal 1 opsi',
                              icon: Icons.bookmark_add_outlined,
                              isNeeded: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: OutlinedButton.icon(
                                onPressed: get.addOptionalAddition,
                                icon: const Icon(
                                  Icons.add,
                                  size: 16,
                                ),
                                label: const Text('Tambah'),
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: get.optionWidget.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return get.optionWidget[index];
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(onPressed: () {}, child: const Text('Simpan')),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
