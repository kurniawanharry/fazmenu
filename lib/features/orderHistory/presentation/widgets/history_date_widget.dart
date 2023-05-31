import 'package:fazmenu/core/components/button/button_radio.dart';
import 'package:fazmenu/core/components/header_bottom_sheet.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';

class HistoryDateWidget extends StatelessWidget {
  const HistoryDateWidget({
    super.key,
    this.onTap,
    this.dateType,
    this.tapDate,
  });

  final Function()? onTap;
  final Function(HistoryDate?)? tapDate;
  final HistoryDate? dateType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderBottomSheet(
          title: 'Pilih Tanggal',
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 10,
            children: [
              ButtonRadio(
                value: dateType,
                groupValue: HistoryDate.today,
                label: 'Hari ini',
                onChanged: tapDate,
              ),
              ButtonRadio(
                value: dateType,
                groupValue: HistoryDate.yesterday,
                label: 'Kemarin',
                onChanged: tapDate,
              ),
              ButtonRadio(
                value: dateType,
                groupValue: HistoryDate.pastSevenDay,
                label: '7 hari terakhir',
                onChanged: tapDate,
              ),
              ButtonRadio(
                value: dateType,
                groupValue: HistoryDate.pasThirtyDay,
                label: '30 hari terakhir',
                onChanged: tapDate,
              ),
              ButtonRadio(
                value: dateType,
                groupValue: HistoryDate.adjust,
                label: 'Sesuaikan',
                onChanged: tapDate,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date Range',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: onTap,
                child: const IgnorePointer(
                  ignoring: true,
                  child: SingleLineField(
                    readOnly: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Konfirmasi'),
          ),
        )
      ],
    );
  }
}
