import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  late BuildContext context;

  HistoryDate? dateType = HistoryDate.today;

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
    end: DateTime.now(),
  );

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  ///ROUTES
  goToExport() {
    Get.toNamed('/export');
  }

  updateHistoryDate(HistoryDate? value) {
    dateType = value;
    update();
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
