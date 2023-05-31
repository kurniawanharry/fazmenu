import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/radio/radio_tile.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/basic/time_arrangement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguangeArrangement extends GetView<TimeArrangement> {
  const LanguangeArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Bahasa'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: const [
                  TitleListTile(
                    title: 'Pilih bahasa',
                    isNeeded: true,
                  ),
                  RadioTile(isSelected: true, title: 'Indonesia'),
                  SizedBox(height: 10),
                  RadioTile(isSelected: false, title: 'English'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
