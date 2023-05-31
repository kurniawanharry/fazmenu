import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/radio/radio_tile.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/components/text_field/price_text_field.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/integration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntegrationArrangement extends GetView<IntegrationController> {
  const IntegrationArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembulatan'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomSwitchTile(
                    title: const Text('Pembulatan'),
                    value: controller.isIntegration.value,
                    onChanged: controller.toggleIntegration,
                  ),
                )),
            GetX<IntegrationController>(
              builder: (_) {
                return Visibility(
                  visible: controller.isIntegration.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              const TitleListTile(
                                title: 'Nama',
                              ),
                              RadioTile(
                                  isSelected: true,
                                  title: 'Bulatkan ke angka ratusan',
                                  onTap: () {}),
                              const SizedBox(height: 10),
                              RadioTile(
                                  isSelected: false,
                                  title: 'Bulatkan ke angka ribuan',
                                  onTap: () {}),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleListTile(
                                title: 'Pembulatan kebawah dari',
                              ),
                              const PriceTextField(),
                              const SizedBox(height: 5),
                              Text(
                                '1.000 adalah 1.000, 1.001 adalah 1.100',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
