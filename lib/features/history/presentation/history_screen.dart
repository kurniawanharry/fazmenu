import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';

List<String> list = ['1', '2', '3'];

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        navigationPanel: NavigationPanel.history,
        widget: Scaffold(
          appBar: AppBar(
            title: Text('Riwayat Pesanan'),
          ),
          body: _body(),
        ),
      );
    } else {
      return Scaffold(
        drawer: const HomeDrawer(
          navigationPanel: NavigationPanel.history,
        ),
        appBar: AppBar(
          title: Text('Riwayat Pesanan'),
        ),
        body: _body(),
      );
    }
  }

  SafeArea _body() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    hintText: 'Cari',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                    buttonHeight: 50,
                    buttonWidth: double.infinity,
                    itemHeight: 50,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                    buttonHeight: 50,
                    buttonWidth: double.infinity,
                    itemHeight: 50,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
