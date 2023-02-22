import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        navigationPanel: NavigationPanel.settings,
        widget: Scaffold(
          appBar: AppBar(
            title: const Text('Tambahan'),
          ),
          body: _body(size.width),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        elevation: 0,
      ),
      drawer: const HomeDrawer(
        navigationPanel: NavigationPanel.settings,
      ),
      body: _body(size.width),
    );
  }

  Column _body(double width) {
    return Column(
      children: [
        Visibility(
          visible: width < Constants.maxWidth,
          child: Container(
            color: Colors.blue,
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
                leading: Icon(Icons.account_box),
                title: Text('Akun'),
              ),
              ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: true,
                    headerBuilder: (context, isExpanded) => ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Pengaturan Dasar'),
                    ),
                    body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('Akun Bank'),
                            subtitle: Text('text text text'),
                          ),
                          ListTile(
                            title: Text('Layanan'),
                            subtitle: Text('text text text'),
                          ),
                          ListTile(
                            title: Text('Jam Buka'),
                            subtitle: Text('text text text'),
                          ),
                          ListTile(
                            title: Text('Pengaturan Bahasa'),
                            subtitle: Text('text text text'),
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
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: true,
                    headerBuilder: (context, isExpanded) => ListTile(
                      leading: Icon(Icons.rocket),
                      title: Text('Material'),
                    ),
                    body: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Banner'),
                              TextButton(
                                onPressed: () {},
                                child: Text('Sesuaikan cover menu'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Banner diskon'),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kode QR'),
                              TextButton(
                                onPressed: () {},
                                child: Text('Kode QR Toko'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('kode QR Meja'),
                              ),
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
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: true,
                    headerBuilder: (context, isExpanded) => ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('Set Pembayaran'),
                    ),
                    body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('Pajak'),
                            subtitle: Text('text text text'),
                          ),
                          ListTile(
                            title: Text('Biaya Layanan'),
                            subtitle: Text('text text text'),
                          ),
                          ListTile(
                            title: Text('Pembulatan'),
                            subtitle: Text('text text text'),
                          ),
                          ListTile(
                            title: Text('Pilihan Pembayaran'),
                            subtitle: Text('text text text'),
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
  }
}
