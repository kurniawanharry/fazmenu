import 'package:get/get.dart';

class IntegrationController extends GetxController {
  RxBool isIntegration = false.obs;

  toggleIntegration(bool? value) {
    isIntegration.value = value!;
  }
}
