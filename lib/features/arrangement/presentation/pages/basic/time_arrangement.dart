import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TimeArrangement extends GetView<TimeController> {
  const TimeArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jam Buka'),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomSwitchTile(
                title: const Text('jam Buka Sama Setiap Hari'),
                subTitle: const Text('Cukup set satu kali untuk setiap hari'),
                onChanged: (p0) {},
                value: false,
              ),
            ),
          ),
          ...List.generate(controller.timeList.length, (index) {
            var time = controller.timeList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListTile(
                title: Text(time.day ?? ''),
                subtitle: Row(
                  children: [
                    const Icon(MdiIcons.clockOutline),
                    const SizedBox(width: 5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: time.startDate ?? ''),
                          const TextSpan(text: ' - '),
                          TextSpan(text: time.endDate ?? ''),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: const ButtonEdit(),
                onTap: () {
                  controller.editButton(time.day);
                },
              ),
            );
          })
        ],
      )),
    );
  }
}
