
import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/button/custom_icon_button.dart';
import 'package:fazmenu/core/components/checkbox/custom_checkbox_tile.dart';
import 'package:fazmenu/core/components/chip/custom_chip.dart';
import 'package:fazmenu/core/components/chip/custom_chip_neutral.dart';
import 'package:fazmenu/core/components/dropdown/custom_dropdown_field.dart';
import 'package:fazmenu/core/components/radio/radio_tile.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/services_arrangement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ServicesArrangement extends StatelessWidget {
  const ServicesArrangement({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesArrangementController>(
      init: ServicesArrangementController(),
      builder: (get) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Layanan'),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                CustomSwitchTile(
                  value: get.takeIn,
                  onChanged: get.toggleTakeIn,
                  title: Text(
                    'Ambil di Tempat',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomSwitchTile(
                    value: get.stayIn,
                    onChanged: get.toggleStayIn,
                    title: Row(
                      children: [
                        Text(
                          'Makan di Tempat',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomIconButton(
                          icon: Icons.info,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
                CustomSwitchTile(
                  value: get.takeOut,
                  onChanged: get.toggleTakeOut,
                  title: Text(
                    'Pesan Antar',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                CustomSwitchTile(
                  value: get.scheduleOrder,
                  onChanged: get.toggleScheduleOrder,
                  title: Row(
                    children: [
                      Text(
                        'Pesan Terjadwal',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const CustomChip(
                        text: 'Baru',
                      )
                    ],
                  ),
                  subTitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Persan Terjadwal',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              ' kerja fitur ini',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: FazColors.blue[600],
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: get.scheduleOrder!,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aktifkan pesan terjadwal untuk:',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                        Visibility(
                          visible: !get.editSchedule!,
                          replacement: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                CustomCheckboxTile(
                                  title: 'Pesan Antar',
                                  value: false,
                                  onChanged: (p0) {},
                                ),
                                const SizedBox(height: 5),
                                CustomCheckboxTile(
                                  title: 'Ambil ditempat',
                                  value: true,
                                  onChanged: (p0) {},
                                ),
                              ],
                            ),
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 10,
                            children: [
                              ...List.generate(
                                1,
                                (index) => const CustomChipNeutral(
                                  text: 'Ambil Di Tempat',
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Persiapan waktu',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontSize: 12),
                                ),
                                CustomIconButton(
                                  icon: Icons.info,
                                  onTap: () {},
                                ),
                              ],
                            ),
                            Visibility(
                              visible: !get.editSchedule!,
                              replacement: Column(
                                children: [
                                  GridView.count(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 5,
                                    children: [
                                      RadioTile(
                                        isSelected: get.serviceDate == ServiceDate.fifteen,
                                        title: '15 Menit',
                                        onTap: () {
                                          get.toggleServiceDate(ServiceDate.fifteen);
                                        },
                                      ),
                                      RadioTile(
                                        isSelected: get.serviceDate == ServiceDate.thirty,
                                        title: '30 Menit',
                                        onTap: () {
                                          get.toggleServiceDate(ServiceDate.thirty);
                                        },
                                      ),
                                      RadioTile(
                                        isSelected: get.serviceDate == ServiceDate.fourty,
                                        title: '40 Menit',
                                        onTap: () {
                                          get.toggleServiceDate(ServiceDate.fourty);
                                        },
                                      ),
                                      RadioTile(
                                        isSelected: get.serviceDate == ServiceDate.adjust,
                                        title: 'Sesuaikan',
                                        onTap: () {
                                          get.toggleServiceDate(ServiceDate.adjust);
                                        },
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: get.serviceDate == ServiceDate.adjust,
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: SingleLineField(
                                            contentPadding:
                                                EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomDropdownField(
                                            items: Constants.times,
                                            valueData: 'Menit',
                                            onChange: (p0) {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        get.toggleSchedule();
                                      },
                                      child: const Text('Simpan'),
                                    ),
                                  ),
                                ],
                              ),
                              child: Text(
                                '15 Menit',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: FazColors.slate[400],
                                    ),
                              ),
                            ),
                            Visibility(
                              visible: !get.editSchedule!,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    get.toggleSchedule();
                                  },
                                  icon: const Icon(Icons.edit),
                                  label: const Text('Ubah'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  color: FazColors.slate[100],
                  margin: const EdgeInsets.symmetric(vertical: 5),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alamat Pengambilan',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ButtonEdit(
                        onTap: get.goToAddress,
                      )
                    ],
                  ),
                  subtitle: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
