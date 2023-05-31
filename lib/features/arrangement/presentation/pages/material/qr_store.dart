import 'package:fazmenu/core/components/clip/bottom_arrow_container.dart';
import 'package:fazmenu/core/components/clip/qr_overlay.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class QrStore extends StatelessWidget {
  const QrStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Kode Toko'),
      ),
      backgroundColor: FazColors.blue[600],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 70,
              decoration: ShapeDecoration(
                shape: const TooltipShapeBorder(),
                color: FazColors.blue[500],
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.qr_code,
                    color: FazColors.white,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Pelanggan dapat melihat halaman utama menu Anda dan memesan setelah memindai kode QR berikut',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: FazColors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icons/png/qr.png',
                      height: 250,
                      width: 250,
                    ),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      shape: CardScannerOverlayShape(
                        borderColor: Colors.white,
                        borderRadius: 10,
                        borderLength: 25,
                        borderWidth: 10,
                        overlayColor: FazColors.blue[600]!,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Silahkan unduh dan cetak untuk toko Anda. Anda juga dapat menggunakan desain sendiri sebelum mencetaknya',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: FazColors.white,
                        ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FazColors.white,
                      foregroundColor: FazColors.black,
                    ),
                    onPressed: () {},
                    child: const Text('Simpan'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
