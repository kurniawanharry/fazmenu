import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final Rx<CarouselController> carouselController = CarouselController().obs;

  RxInt activeIndex = 0.obs;

  changeIndex(int index) {
    activeIndex.value = index;
    update();
  }
}
