import 'package:fazmenu/features/arrangement/data/models/payment_channel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentArrangementController extends GetxController {
  late BuildContext context;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  List<PaymentChannel> bankChannel = [
    PaymentChannel(
      name: 'BCA',
      logo: 'https://statik.tempo.co/data/2019/04/23/id_836405/836405_720.jpg',
    ),
  ];
  List<PaymentChannel> eWalletChannel = [
    PaymentChannel(
      name: 'OVO',
      logo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Logo_ovo_purple.svg/2560px-Logo_ovo_purple.svg.png',
    ),
  ];
}
