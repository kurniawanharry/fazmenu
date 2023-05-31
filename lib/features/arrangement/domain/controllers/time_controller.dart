import 'package:fazmenu/features/arrangement/data/models/time.dart';
import 'package:get/get.dart';

class TimeController extends GetxController {
  RxBool isAllDay = false.obs;
  final RxList<TimeList> _timeList = <TimeList>[].obs;
  RxList<TimeList> get timeList => _timeList;
  RxString dayTitle = ''.obs;

  @override
  void onInit() {
    _timeList.addAll(_time);
    super.onInit();
  }

  toggleAllDay(bool? value) {
    isAllDay.value = value!;
  }

  editButton(String? name) {
    dayTitle.value = name!;
    Get.toNamed('/timeEdit');
  }

  final List<TimeList> _time = [
    TimeList(
      day: 'Senin',
      startDate: '10:00',
      endDate: '21:00',
    ),
    TimeList(
      day: 'Selasa',
      startDate: '10:00',
      endDate: '21:00',
    ),
    TimeList(
      day: 'Rabu',
      startDate: '10:00',
      endDate: '21:00',
    ),
    TimeList(
      day: 'Kamis',
      startDate: '10:00',
      endDate: '21:00',
    ),
    TimeList(
      day: 'Jumat',
      startDate: '10:00',
      endDate: '21:00',
    ),
    TimeList(
      day: 'Sabtu',
      startDate: '10:00',
      endDate: '21:00',
    ),
    TimeList(
      day: 'Minggu',
      startDate: '10:00',
      endDate: '21:00',
    ),
  ];
}
