import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            ListTile(
              title: Text(
                'No. Meja',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              minVerticalPadding: 20,
              isThreeLine: true,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '3',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            ListTile(
              title: Text(
                'Informasi Pembeli',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              minVerticalPadding: 20,
              isThreeLine: true,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                        children: [
                          const TextSpan(text: 'Kevin'),
                          const WidgetSpan(child: SizedBox(width: 10)),
                          TextSpan(
                            text: '+6282163331616',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: SizedBox(
                            width: 180,
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                fixedSize: const Size(double.infinity, 30),
                              ),
                              icon: const Icon(MdiIcons.phone),
                              label: const Text('Telpon Pembeli'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: SizedBox(
                            width: 180,
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                fixedSize: const Size(double.infinity, 30),
                              ),
                              icon: const Icon(
                                MdiIcons.whatsapp,
                              ),
                              label: const Text('WhatsApp'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Detail Menu',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  minVerticalPadding: 20,
                  isThreeLine: true,
                  subtitle: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '1',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 30,
                                      ),
                                ),
                                const TextSpan(text: 'x'),
                              ],
                            ),
                          ),
                        ),
                        title: Text(
                          'Ice Lychee Yakult',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        minVerticalPadding: 10,
                        isThreeLine: true,
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Harga Total'),
                            Text(formatCurrency(10000)),
                          ],
                        ),
                      ),
                      Container(
                        color: FazColors.slate[100],
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.comment),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            ListTile(
              title: Text(
                'Rincian Tagihan',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              minVerticalPadding: 20,
              isThreeLine: true,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('Sub Total',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        formatCurrency(10000),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('Pajak Ekslusif 0%',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        formatCurrency(0),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('Biaya Transaksi',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        '- ${formatCurrency(660)}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 10,
                      title: Text('Pendapatan',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        formatCurrency(21340),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: FazColors.orange[400],
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
            ListTile(
              title: Text(
                'Data Pesanan',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              minVerticalPadding: 20,
              isThreeLine: true,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('ID Pesanan',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        '12031313213',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('Waktu Pemesanan',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        '02/03/2023 15:24:58',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('Tipe Order',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        'Makan di Tempat',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text('Metode Pembayaran',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400, color: FazColors.slate[500])),
                      trailing: Text(
                        'Gopay',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500, color: FazColors.slate[900]),
                      ),
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Status Pembayaran',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: FazColors.slate[500],
                            ),
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        child: const Text('Cek Status'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 10, color: FazColors.slate[200], height: 10),
          ],
        ),
      ),
    );
  }
}
