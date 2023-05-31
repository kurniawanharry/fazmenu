import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class QrTableInsert extends StatelessWidget {
  const QrTableInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: FazColors.blue[100],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: FazColors.blue[600]!,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          color: FazColors.blue[600],
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Masukkan nomor meja. Tekan Enter untuk membuat meja baru. Setiap no. meja maks 20 karakter',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleLineField(
                    suffixIcon: Visibility(
                      visible: false,
                      child: IconButton(
                        onPressed: () {},
                        iconSize: 20,
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(maxHeight: 35, maxWidth: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Tambah'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
