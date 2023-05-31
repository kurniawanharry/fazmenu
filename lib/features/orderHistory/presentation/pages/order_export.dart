
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderExport extends StatelessWidget {
  OrderExport({super.key});

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ekspor Riwayat Pesanan'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Pilih Tanggal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                'Periode yang dapat dipilih adalah minimum 1 hari dan maksimal 1 bulan',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
              child: InkWell(
                onTap: () {
                  pickDateRange(context);
                },
                child: const IgnorePointer(
                  ignoring: true,
                  child: SingleLineField(
                    readOnly: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Unduh'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    var newDateRage = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.dark(
              primary: FazColors.blue[400]!,
              onPrimary: FazColors.white,
              surface: FazColors.blue[100]!,
              onSurface: FazColors.blue[400]!,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
