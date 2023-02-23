import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fazmenu/core/components/dropdown/custom_dropbutton.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/history/domain/controllers/history_controller.dart';
import 'package:fazmenu/features/history/presentation/widgets/history_card_widget.dart';
import 'package:fazmenu/features/history/presentation/widgets/history_date_widget.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          body: _body(context),
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
        body: _body(context),
      );
    }
  }

  Widget _body(BuildContext context) {
    return GetBuilder<HistoryController>(
        init: HistoryController(),
        builder: (get) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SingleLineField(),
                      const SizedBox(height: 10),
                      CustomDropdown(
                        items: list,
                        valueData: '1',
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
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            enabled: false,
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
                    itemCount: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const HistoryCardWidget();
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<dynamic> _dateOptions(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: FazColors.slate[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return GetBuilder<HistoryController>(builder: (get) {
          return HistoryDateWidget(
            dateType: get.dateType,
            tapDate: get.updateHistoryDate,
            onTap: () {
              get.pickDateRange(context);
            },
          );
        });
      },
    );
  }
}
