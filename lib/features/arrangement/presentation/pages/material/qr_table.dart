import 'package:fazmenu/core/components/button/button_delete.dart';
import 'package:fazmenu/core/components/button/custom_icon_button.dart';
import 'package:fazmenu/core/components/dialog/custom_dialog.dart';
import 'package:fazmenu/core/components/dialog/qr_dialog.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrTable extends StatelessWidget {
  const QrTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kode QR Meha'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.qr_code,
                  size: 40,
                ),
                title: Text(
                  'Menghasilkan kode QR untuk tiap meja. saat dipindai, nomor meja akan diisi lebih dulu untuk pesanan pelanggan di meja',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Flexible(
                        flex: 2,
                        child: SingleLineField(
                          readOnly: true,
                          enabled: false,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            icon: Icons.qr_code,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => const QrDialog(
                                  title: '101',
                                ),
                              );
                            },
                            color: FazColors.neutral[400],
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          ButtonDelete(
                            size: 30,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialog(
                                    icon: DialogIcon.question,
                                    header: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Anda yakin ingin menghapus?\n',
                                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                          TextSpan(
                                            text: '101',
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontSize: 16,
                                                  color: FazColors.blue[600],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: 'Anda yakin ingin menghapus?',
                                    description:
                                        'Pelanggan tidak dapat memesan menggunakan nomor meja yang di hapus',
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Download semua QR'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/qrTableInsert');
                        },
                        child: const Text('Tambah'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
