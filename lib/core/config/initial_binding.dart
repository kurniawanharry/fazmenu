import 'package:fazmenu/features/addition/domain/controllers/addition_controller.dart';
import 'package:fazmenu/features/analytic/domain/controllers/analytic_controller.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/arrangement_controller.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/banner_controller.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/integration_controller.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/recomendation_controller.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/time_controller.dart';
import 'package:fazmenu/features/category/domain/controllers/category_controller.dart';
import 'package:fazmenu/features/category/domain/controllers/category_insert_controller.dart';
import 'package:fazmenu/features/discount/domain/controllers/discount_insert_controller.dart';
import 'package:fazmenu/features/orderHistory/domain/controllers/history_controller.dart';
import 'package:fazmenu/features/home/domain/controllers/drawer_controller.dart';
import 'package:fazmenu/features/order/domain/controllers/order_controller.dart';
import 'package:fazmenu/features/product/domain/controllers/product_category_controller.dart';
import 'package:fazmenu/features/product/domain/controllers/product_controller.dart';
import 'package:fazmenu/features/product/domain/controllers/product_insert_controller.dart';
import 'package:fazmenu/features/product/domain/controllers/product_insert_option_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
    Get.lazyPut<MainDrawerController>(() => MainDrawerController(), fenix: true);
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<ArrangementController>(() => ArrangementController());
    Get.lazyPut<AnalyticController>(() => AnalyticController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<AdditionController>(() => AdditionController(), fenix: true);
    Get.lazyPut<CategoryInsertController>(() => CategoryInsertController(), fenix: true);
    Get.lazyPut<DiscountInsertController>(() => DiscountInsertController(), fenix: true);
    Get.lazyPut<RecomendationController>(() => RecomendationController(), fenix: true);
    Get.lazyPut<IntegrationController>(() => IntegrationController(), fenix: true);
    Get.lazyPut<TimeController>(() => TimeController(), fenix: true);
    Get.lazyPut<BannerController>(() => BannerController(), fenix: true);
    Get.lazyPut<ProductInsertOptionController>(() => ProductInsertOptionController(), fenix: true);
    Get.lazyPut<ProductCategoryController>(() => ProductCategoryController(), fenix: true);
    Get.lazyPut<ProductInsertController>(() => ProductInsertController(), fenix: true);
  }
}
