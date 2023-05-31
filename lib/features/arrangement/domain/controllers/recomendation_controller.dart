import 'package:fazmenu/core/components/dialog/custom_dialog.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendationController extends GetxController {
  late BuildContext context;
  RxBool historyMessage = false.obs;
  RxBool detailMessage = false.obs;
  RxBool screenMessage = false.obs;
  Rx<DetailRecommend> detailRecommend = DetailRecommend.auto.obs;
  final Rx<DetailRecommend> _tempDetailRecommend = DetailRecommend.auto.obs;

  Rx<OrderRecommend> orderRecommend = OrderRecommend.auto.obs;
  final Rx<OrderRecommend> _tempOrderRecommend = OrderRecommend.auto.obs;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  toggleDetailDecommend(DetailRecommend? value) {
    detailRecommend.value = value!;
  }

  toggleOrderDecommend(OrderRecommend? value) {
    orderRecommend.value = value!;
  }

  toggleHistory(bool? value) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        icon: DialogIcon.question,
        title: historyMessage.value
            ? 'Apakah Anda yakin untuk nonaktifkan rekomendasi produk'
            : 'Apakah Anda yakin untuk mengaktifkan rekomendasi produk',
        nextCallback: (p0) {
          historyMessage.value = value!;
        },
      ),
    );
  }

  toggleDetail(bool? value) {
    if (detailMessage.value) {
      if (detailRecommend.value == DetailRecommend.manual) {
        _tempDetailRecommend.value = DetailRecommend.manual;
        toggleDetailDecommend(DetailRecommend.auto);
      } else {
        _tempDetailRecommend.value = DetailRecommend.auto;
      }
    }

    if (!detailMessage.value) {
      if (_tempDetailRecommend.value == DetailRecommend.manual) {
        detailRecommend.value = _tempDetailRecommend.value;
      }
    }
    detailMessage.value = value!;
  }

  toggleScreen(bool? value) {
    if (screenMessage.value) {
      if (orderRecommend.value == OrderRecommend.manual) {
        _tempOrderRecommend.value = OrderRecommend.manual;
        toggleOrderDecommend(OrderRecommend.auto);
      } else {
        _tempOrderRecommend.value = OrderRecommend.auto;
      }
    }

    if (!screenMessage.value) {
      if (_tempOrderRecommend.value == OrderRecommend.manual) {
        orderRecommend.value = _tempOrderRecommend.value;
      }
    }
    screenMessage.value = value!;
  }
}
