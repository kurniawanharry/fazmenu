
import 'package:fazmenu/core/components/checkbox/custom_checkbox_tile.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/radio/radio_tile_no_border.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class ServiceFeeArrangement extends StatelessWidget {
  const ServiceFeeArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biaya Layanan'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomSwitchTile(
                title: const Text('Biaya Layanan'),
                value: true,
                onChanged: (p0) {},
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
              child: Column(
                children: [
                  const TitleListTile(
                    title: 'Nama',
                  ),
                  RadioTileNoBorder(isSelected: true, title: 'Semua jenis layanan', onTap: () {}),
                  const SizedBox(height: 10),
                  RadioTileNoBorder(
                      isSelected: false, title: 'Atur sesuai tipe layanan', onTap: () {}),
                ],
              ),
            ),
            CustomSwitchTile(title: const Text('Ambil di Tempat'), value: true, onChanged: (p0) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomSwitchTile(
                  title: const Text('Makan di Tempat'), value: true, onChanged: (p0) {}),
            ),
            CustomSwitchTile(title: const Text('Pesan Antar'), value: true, onChanged: (p0) {}),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
              child: Column(
                children: [
                  const TitleListTile(
                    iconTitle: Icons.info,
                    title: 'Biaya Layanan',
                    isNeeded: true,
                  ),
                  RadioTileNoBorder(isSelected: true, title: 'Presentasi (%)', onTap: () {}),
                  const SizedBox(height: 10),
                  RadioTileNoBorder(isSelected: false, title: 'Dalam Rupiah (Rp)', onTap: () {}),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SingleLineField(),
                  ),
                  CustomCheckboxTile(
                    title: 'Tidak termasuk dalam perhitungan Pajak',
                    value: true,
                    onChanged: (p0) {},
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
