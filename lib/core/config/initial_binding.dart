import 'package:fazmenu/features/home/domain/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../features/home/domain/controllers/drawer_controller.dart';

class InitialBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MainDrawerController>(() => MainDrawerController());
  }
}
