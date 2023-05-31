import 'package:fazmenu/features/discount/data/models/day.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountInsertController extends GetxController {
  RxString dropdownValue = ''.obs;
  RxInt currentPage = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final RxList<DayList> _dayList = <DayList>[].obs;
  final RxList<DayList> _paymentList = <DayList>[].obs;
  final RxList<DayList> _orderList = <DayList>[].obs;
  RxList<DayList> get dayList => _dayList;
  RxList<DayList> get paymentList => _paymentList;
  RxList<DayList> get orderList => _orderList;
  RxBool additionSetting = false.obs;

  @override
  void onInit() {
    _dayList.addAll(list);
    _paymentList.addAll(listPay);
    _orderList.addAll(listOrder);
    super.onInit();
  }

  toggleAdditionSetting(bool? value) {
    additionSetting.value = value!;
  }

  updateDropdown(String? value) {
    dropdownValue.value = value!;
  }

  updatePage() {
    currentPage.value++;
    pageController.value.animateToPage(currentPage.value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  previousPage() {
    if (currentPage.value != 0) {
      currentPage.value--;
      pageController.value.animateToPage(currentPage.value,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Get.back();
    }
  }

  nextButton() {
    if (formKey.value.currentState!.validate()) {
      if (currentPage.value != 2) {
        updatePage();
      } else if (currentPage.value == 2) {
        Get.back();
      }
    }
  }

  RxList<DayList> list = [
    DayList(
      status: true.obs,
      tittle: 'Senin',
    ),
    DayList(
      status: true.obs,
      tittle: 'Selasa',
    ),
    DayList(
      status: true.obs,
      tittle: 'Rabu',
    ),
    DayList(
      status: true.obs,
      tittle: 'Kamis',
    ),
    DayList(
      status: true.obs,
      tittle: 'Jumat',
    ),
    DayList(
      status: true.obs,
      tittle: 'Sabtu',
    ),
    DayList(
      status: true.obs,
      tittle: 'Minggu',
    ),
    DayList(
      status: true.obs,
      tittle: 'Setiap hari',
    ),
  ].obs;

  RxList<DayList> listPay = [
    DayList(
      status: true.obs,
      tittle: 'Gopay',
    ),
    DayList(
      status: true.obs,
      tittle: 'OVO',
    ),
    DayList(
      status: true.obs,
      tittle: 'ShopeePay',
    ),
    DayList(
      status: true.obs,
      tittle: 'Bayar di Kasir',
    ),
    DayList(
      status: true.obs,
      tittle: 'DANA',
    ),
    DayList(
      status: true.obs,
      tittle: 'BCA VA',
    ),
    DayList(
      status: true.obs,
      tittle: 'BNI VA',
    ),
    DayList(
      status: true.obs,
      tittle: 'BRI VA',
    ),
    DayList(
      status: true.obs,
      tittle: 'Permata VA',
    ),
    DayList(
      status: true.obs,
      tittle: 'Mandiri VA',
    ),
  ].obs;

  RxList<DayList> listOrder = [
    DayList(
      status: true.obs,
      tittle: 'Makan di Tempat',
    ),
    DayList(
      status: true.obs,
      tittle: 'Ambil di Tempat',
    ),
    DayList(
      status: true.obs,
      tittle: 'Pesan Antar',
    ),
  ].obs;

  updateStatus(int index, bool? value) {
    _dayList[index].status!.value = value!;
  }

  updateStatusPayment(int index, bool? value) {
    _paymentList[index].status!.value = value!;
  }

  updateOrder(int index, bool? value) {
    orderList[index].status!.value = value!;
  }
}
