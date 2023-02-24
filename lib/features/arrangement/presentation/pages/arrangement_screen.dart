import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/button/custom_icon_button.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/arrangement_controller.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class ArrangementScreen extends StatelessWidget {
  const ArrangementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        navigationPanel: NavigationPanel.settings,
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
        elevation: 0,
      ),
      drawer: const HomeDrawer(
        navigationPanel: NavigationPanel.settings,
      ),
      body: _body(size.width, context),
    );
  }

  Widget _body(double width, BuildContext context) {
    return GetBuilder<ArrangementController>(
        init: ArrangementController(),
        builder: (get) {
          return Column(
            children: [
              Visibility(
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
                          'Nijika',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.account_box),
                      title: Text(
                        'Akun',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {},
                    ),
                    ExpansionPanelList(
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
                          body: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                      Text('Jam Buka',
                                          style: Theme.of(context).textTheme.bodyMedium),
                                      CustomIconButton(
                                        icon: Icons.info,
                                        onTap: () {},
                                      )
                                    ],
                                  ),
                                  subtitle: const Text(
                                      'Atur Buka tutup toko. Terima order hanya saat toko Anda Buka'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: FazColors.slate[400]!,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: Text(
                                    'Pengaturan Bahasa',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  subtitle:
                                      const Text('Atur Bahasa yang akan digunakan oleh Pembeli'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: FazColors.slate[400]!,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionPanelList(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                      title: const Text('Sesuaikan cover menu'),
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
                                      title: const Text('Banner diskon'),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: FazColors.slate[400]!,
                                      ),
                                      onTap: () {},
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
                                      title: const Text('Kode QR Toko'),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: FazColors.slate[400]!,
                                      ),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      style: ListTileStyle.drawer,
                                      title: const Text('kode QR Meja'),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: FazColors.slate[400]!,
                                      ),
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionPanelList(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                      trailing: TextButton(
                                        onPressed: () {},
                                        child: ButtonEdit(
                                          onTap: () {},
                                        ),
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
                                  onTap: () {},
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
                                  onTap: () {},
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
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
