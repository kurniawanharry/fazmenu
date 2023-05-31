import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/button/custom_icon_button.dart';
import 'package:fazmenu/core/components/header_bottom_sheet.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/arrangement_controller.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ArrangementScreen extends StatelessWidget {
  const ArrangementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        widget: Scaffold(
          appBar: AppBar(
            title: const Text('Pengaturan'),
          ),
          body: _body(size.width, context),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        leading: kIsWeb ? null : const ButtonMenu(),
      ),
      drawer: kIsWeb ? const DrawerNavigation() : null,
      body: _body(size.width, context),
    );
  }

  Widget _header(double width) {
    return Visibility(
      visible: width < Constants.maxWidth,
      child: Container(
        color: FazColors.blue[600],
        height: 104,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(
                  'https://i.pinimg.com/564x/35/20/bb/3520bb45c416038b371f515b9050f3eb.jpg'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Starry',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(double width, BuildContext context) {
    return GetBuilder<ArrangementController>(
      init: Get.find<ArrangementController>(),
      builder: (get) {
        return Column(
          children: [
            _header(width),
            Expanded(
              child: ListView(
                children: [
                  _account(get, context),
                  _basic(get, context),
                  _material(get, context),
                  _payment(get, context),
                  _pos(get, context),
                  _recomendation(get, context),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _account(ArrangementController get, BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        get.toggleAccount();
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: get.expandAccount!,
          headerBuilder: (context, isExpanded) => ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Akun',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Container(
            color: FazColors.slate[50],
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Nama toko',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Starry'),
                ),
                ListTile(
                  title: Text(
                    'Nama akun',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Najika'),
                ),
                ListTile(
                  title: Text(
                    'Nomor telepon',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('+62812341232'),
                ),
                ListTile(
                  title: Text(
                    'Alamat email',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('starry@gmail.com'),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Alamat toko', style: Theme.of(context).textTheme.bodyMedium),
                          CustomIconButton(
                            icon: Icons.info,
                            onTap: () {},
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Salin'),
                      )
                    ],
                  ),
                  subtitle: const Text('https://'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _basic(ArrangementController get, BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        get.toggleBasic();
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: get.expandBasic!,
          headerBuilder: (context, isExpanded) => ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Pengaturan Dasar',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Container(
            color: FazColors.slate[50],
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Akun Bank',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                CreditCardWidget(
                  padding: 10,
                  height: 250,
                  width: 400,
                  cardNumber: '4444 1111 1111 4141',
                  expiryDate: '12/30',
                  cardHolderName: 'PT Digital Laskar Pelangi',
                  cvvCode: '123',
                  bankName: 'Bank BCA',
                  cardType: CardType.visa,
                  showBackView: false,
                  isHolderNameVisible: true,
                  cardBgColor: FazColors.slate[900]!,
                  onCreditCardWidgetChange:
                      (creditCardBrand) {}, //true when you want to show cvv(back) view
                ),
                ListTile(
                  title: Text(
                    'Layanan',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Pilih layanan yang disediakan di Fazmenu'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: FazColors.slate[400]!,
                  ),
                  onTap: get.goToServicesArrangement,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text('Jam Buka', style: Theme.of(context).textTheme.bodyMedium),
                      CustomIconButton(
                        icon: Icons.info,
                        onTap: () {},
                      )
                    ],
                  ),
                  subtitle:
                      const Text('Atur Buka tutup toko. Terima order hanya saat toko Anda Buka'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: FazColors.slate[400]!,
                  ),
                  onTap: () {
                    Get.toNamed('/time');
                  },
                ),
                ListTile(
                  title: Text(
                    'Pengaturan Bahasa',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Atur Bahasa yang akan digunakan oleh Pembeli'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: FazColors.slate[400]!,
                  ),
                  onTap: () {
                    Get.toNamed('/language');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _material(ArrangementController get, BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        get.toggleMaterial();
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: get.expandMaterial!,
          headerBuilder: (context, isExpanded) => ListTile(
            leading: const Icon(Icons.rocket),
            title: Text(
              'Material',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Container(
            color: FazColors.slate[50],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Banner',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                      style: ListTileStyle.drawer,
                      title: Text(
                        'Sesuaikan cover menu',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: FazColors.slate[400]!,
                      ),
                      onTap: () {
                        Get.toNamed('/coverMenu');
                      },
                    ),
                    ListTile(
                      style: ListTileStyle.drawer,
                      title: Text(
                        'Banner diskon',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: FazColors.slate[400]!,
                      ),
                      onTap: () {
                        Get.toNamed('/banner');
                      },
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kode QR',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                        style: ListTileStyle.drawer,
                        title: Text(
                          'Kode QR Toko',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: FazColors.slate[400]!,
                        ),
                        onTap: () {
                          Get.toNamed('/qr');
                        }),
                    ListTile(
                      style: ListTileStyle.drawer,
                      title: Text(
                        'kode QR Meja',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: FazColors.slate[400]!,
                      ),
                      onTap: () {
                        Get.toNamed('/qrTable');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _payment(ArrangementController get, BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        get.togglePayment();
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: get.expandPayment!,
          headerBuilder: (context, isExpanded) => ListTile(
            leading: const Icon(Icons.payment),
            title: Text(
              'Set Pembayaran',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Container(
            color: FazColors.slate[50],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pajak',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Nilai Pajak',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            ' (10%)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      trailing: ButtonEdit(
                        onTap: () {
                          taxBottomSheet(context);
                        },
                      ),
                    ),
                    CustomSwitchTile(
                      title: Text(
                        'Pajak inklusif',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      value: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 5),
                    CustomSwitchTile(
                      title: Row(
                        children: [
                          Text(
                            'Makan di Tempat',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomIconButton(
                            icon: Icons.info,
                            onTap: () {},
                          )
                        ],
                      ),
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Biaya Layanan',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Biaya layanan pelanggan tersedia'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: FazColors.slate[400]!,
                  ),
                  onTap: () {
                    Get.toNamed('/serviceFee');
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Pembulatan',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Aplikasikan pembulatan dalam pesanan'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: FazColors.slate[400]!,
                  ),
                  onTap: () {
                    Get.toNamed('/integration');
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Pilihan Pembayaran',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: const Text('Opsi pilihan pembayaran untuk toko kamu'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: FazColors.slate[400]!,
                  ),
                  onTap: get.goToPaymentArrangement,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _pos(ArrangementController get, BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        get.togglePos();
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: get.expandPos!,
          headerBuilder: (context, isExpanded) => ListTile(
            leading: const Icon(Icons.payment),
            title: Text(
              'Pengaturan POS',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Container(
            color: FazColors.slate[50],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerLeft,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Manajemen POS',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: const Text('Biaya layanan pelanggan tersedia'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: FazColors.slate[400]!,
              ),
              onTap: () {
                Get.toNamed('/managementPos');
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _recomendation(ArrangementController get, BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.thumb_up_off_alt_outlined),
      title: Text(
        'Produk Rekomendasi',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: FazColors.slate[400]!,
        ),
      ),
      onTap: () {
        Get.toNamed('/recomendation');
      },
    );
  }

  Future taxBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderBottomSheet(
                title: 'Nilai Pajak',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: const [
                    TitleListTile(
                      title: 'Nilai Pajak',
                    ),
                    SingleLineField(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ElevatedButton(onPressed: () {}, child: const Text('Simpan')),
              )
            ],
          ),
        );
      },
    );
  }
}
