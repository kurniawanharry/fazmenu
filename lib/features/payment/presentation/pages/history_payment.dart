import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/dropdown/custom_dropdown_field.dart';
import 'package:fazmenu/core/components/text_field/search_text_field.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/orderHistory/presentation/widgets/history_date_widget.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:fazmenu/features/payment/presentation/widgets/payment_history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HistoryPayment extends StatelessWidget {
  const HistoryPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        leading: const ButtonMenu(),
      ),
      drawer: kIsWeb ? const DrawerNavigation() : null,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: FazColors.blue[600]!,
              ),
              child: Column(
                children: [
                  const SearchTextField(),
                  const SizedBox(height: 10),
                  CustomDropdownField(
                    items: Constants.orderHistory,
                    valueData: 'Semua pesanan',
                    onChange: (p0) {},
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      _dateOptions(context);
                    },
                    child: const IgnorePointer(
                      ignoring: true,
                      child: SingleLineField(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        suffixIconConstraints: BoxConstraints(
                            minWidth: 45, maxWidth: 80, minHeight: 35, maxHeight: 40),
                        suffixIcon: Icon(Icons.keyboard_arrow_down, size: 15),
                        readOnly: true,
                        hint: 'Pilih Hari',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const PaymentHistoryCardWidget();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Ekspor Riwayat Pembayaran'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _dateOptions(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (context) {
        return HistoryDateWidget(
          dateType: HistoryDate.adjust,
          tapDate: (p0) {},
          onTap: () {},
        );
      },
    );
  }
}
