import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/payment_arrangement_controller.dart';
import 'package:fazmenu/features/arrangement/presentation/widgets/payment_channel_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PaymentArrangement extends StatelessWidget {
  const PaymentArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilihan Pembayaran'),
      ),
      body: GetBuilder<PaymentArrangementController>(
        init: PaymentArrangementController(),
        builder: (get) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    children: [
                      PaymentChannelItem(
                        title: 'E-Wallet',
                        subTitle: 'Minimum pembayaran pelanggan Rp100',
                        activePayment: true,
                        paymentList: get.eWalletChannel,
                        paymentChannelName: const [''],
                        onChanged: (p0) {},
                        onChangedActivated: (p0) {},
                      ),
                      PaymentChannelItem(
                        title: 'Bank Transfer',
                        subTitle: 'Minimum pembayaran pelanggan Rp400.000',
                        activePayment: true,
                        paymentList: get.bankChannel,
                        paymentChannelName: const [''],
                        onChanged: (p0) {},
                        onChangedActivated: (p0) {},
                      ),
                      Divider(height: 20, thickness: 5, color: FazColors.slate[200]),
                      CustomSwitchTile(
                        title: Row(
                          children: [
                            Icon(
                              MdiIcons.cardBulletedOutline,
                              size: 25,
                              color: FazColors.slate[700]!,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Pembayaran tunai dan kartu',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                              ),
                            ),
                          ],
                        ),
                        subTitle: Text(
                          'Pelanggan Dapat Membayar di kasir dengan kartu atau uang tunai',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        value: false,
                        onChanged: (p0) {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Simpan'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
