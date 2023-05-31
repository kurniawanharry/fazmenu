import 'package:fazmenu/core/components/radio/radio_tile_no_border.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeEdit extends GetView<TimeController> {
  const TimeEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Ubah Jam Buka ${controller.dayTitle.value}')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                children: [
                  RadioTileNoBorder(
                    isSelected: false,
                    title: 'Buka 24 Jam',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: RadioTileNoBorder(
                      isSelected: false,
                      title: 'Tutup',
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  RadioTileNoBorder(
                    isSelected: true,
                    title: 'Atur jam',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buka',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                            ),
                            const SizedBox(height: 5),
                            const SingleLineField(),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 15,
                        color: FazColors.black,
                        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tutup',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                            ),
                            const SizedBox(height: 5),
                            const SingleLineField(),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: OutlinedButton(onPressed: () {}, child: const Text('Tambah Slot')),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
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
