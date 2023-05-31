import 'package:fazmenu/features/addition/presentation/pages/addition_insert.dart';
import 'package:fazmenu/features/addition/presentation/pages/addition_screen.dart';
import 'package:fazmenu/features/analytic/presentation/pages/analytic_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/basic/address_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/arrangement_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/basic/time_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/basic/time_edit.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/banner_insert.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/cover_banner_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/preview_banner.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/qr_store.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/qr_table.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/qr_table_insert.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/payment/integration_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/basic/language_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/pos/management_pos.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/material/cover_menu_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/payment/payment_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/recomendation/recomendation_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/basic/service_arrangement.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/payment/service_fee_arrangement.dart';
import 'package:fazmenu/features/auth/presentation/pages/authentication.dart';
import 'package:fazmenu/features/auth/presentation/pages/boarding.dart';
import 'package:fazmenu/features/category/presentation/pages/category_insert.dart';
import 'package:fazmenu/features/category/presentation/pages/category_screen.dart';
import 'package:fazmenu/features/category/presentation/pages/category_view.dart';
import 'package:fazmenu/features/discount/presentation/pages/discount_insert.dart';
import 'package:fazmenu/features/discount/presentation/pages/discount_screen.dart';
import 'package:fazmenu/features/orderHistory/presentation/pages/order_export.dart';
import 'package:fazmenu/features/orderHistory/presentation/pages/order_history.dart';
import 'package:fazmenu/features/home/presentation/pages/home.dart';
import 'package:fazmenu/features/home/presentation/pages/splash.dart';
import 'package:fazmenu/features/order/presentation/pages/order_detail.dart';
import 'package:fazmenu/features/order/presentation/pages/order_screen.dart';
import 'package:fazmenu/features/payment/presentation/pages/history_payment.dart';
import 'package:fazmenu/features/product/presentation/pages/product_preview.dart';
import 'package:fazmenu/features/product/presentation/pages/product_category.dart';
import 'package:fazmenu/features/product/presentation/pages/product_insert.dart';
import 'package:fazmenu/features/product/presentation/pages/product_insert_option.dart';
import 'package:fazmenu/features/product/presentation/pages/product_option.dart';
import 'package:fazmenu/features/product/presentation/pages/product_screen.dart';
import 'package:fazmenu/features/product/presentation/pages/product_search.dart';
import 'package:fazmenu/features/product/presentation/pages/product_stock.dart';
import 'package:fazmenu/main.dart';
import 'package:get/get.dart';

class Routes {
  static const initial = "/splash";
  static final routes = [
    GetPage(name: "/", page: () => const MyApp()),
    GetPage(name: "/boarding", page: () => const Boarding(), transition: Transition.noTransition),
    GetPage(name: "/auth", page: () => const Authentication(), transition: Transition.noTransition),
    GetPage(name: "/home", page: () => const Home(), transition: Transition.noTransition),
    GetPage(name: "/splash", page: () => const Splash(), transition: Transition.noTransition),

    ///ORDER
    GetPage(
      name: "/order",
      page: () => const OrderScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/orderDetail",
      page: () => const OrderDetail(),
      transition: Transition.noTransition,
    ),

    ///ARRANGEMENT
    GetPage(
        name: "/settings",
        page: () => const ArrangementScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: "/coverMenu",
        page: () => const CoverMenuScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: "/payment",
        page: () => const PaymentArrangement(),
        transition: Transition.noTransition),
    GetPage(
        name: "/address",
        page: () => const AddressArrangement(),
        transition: Transition.noTransition),
    GetPage(
        name: "/service",
        page: () => const ServicesArrangement(),
        transition: Transition.noTransition),
    GetPage(
        name: "/recomendation",
        page: () => const RecomendationArrangement(),
        transition: Transition.noTransition),
    GetPage(
        name: "/managementPos",
        page: () => const ManagementPos(),
        transition: Transition.noTransition),
    GetPage(
        name: "/integration",
        page: () => const IntegrationArrangement(),
        transition: Transition.noTransition),
    GetPage(
        name: "/serviceFee",
        page: () => const ServiceFeeArrangement(),
        transition: Transition.noTransition),
    GetPage(
        name: "/time", page: () => const TimeArrangement(), transition: Transition.noTransition),
    GetPage(name: "/timeEdit", page: () => const TimeEdit(), transition: Transition.noTransition),
    GetPage(
        name: "/language",
        page: () => const LanguangeArrangement(),
        transition: Transition.noTransition),

    ///ADDITION
    GetPage(
        name: "/addition", page: () => const AdditionScreen(), transition: Transition.noTransition),
    GetPage(
        name: "/insertAddition",
        page: () => const AdditionInsert(),
        transition: Transition.noTransition),
    GetPage(name: "/banner", page: () => const CoverBanner(), transition: Transition.noTransition),
    GetPage(
        name: "/bannerInsert",
        page: () => const BannerInsert(),
        transition: Transition.noTransition),
    GetPage(
        name: "/bannerPreview",
        page: () => const PreviewBanner(),
        transition: Transition.noTransition),
    GetPage(name: "/qr", page: () => const QrStore(), transition: Transition.noTransition),
    GetPage(name: "/qrTable", page: () => const QrTable(), transition: Transition.noTransition),
    GetPage(
        name: "/qrTableInsert",
        page: () => const QrTableInsert(),
        transition: Transition.noTransition),

    ///PRODUCT
    GetPage(
      name: "/product",
      page: () => const ProductScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/productStock",
      page: () => const ProductStock(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: "/productInsert",
        page: () => const ProductInsert(),
        transition: Transition.noTransition),
    GetPage(
        name: "/productCategory",
        page: () => const ProductCategory(),
        transition: Transition.noTransition),
    GetPage(
        name: "/productOption",
        page: () => const ProductOption(),
        transition: Transition.noTransition),
    GetPage(
        name: "/productInsertOption",
        page: () => const ProductInsertOption(),
        transition: Transition.noTransition),
    GetPage(
        name: "/productSearch",
        page: () => const ProductSearch(),
        transition: Transition.noTransition),
    GetPage(
        name: "/productPreview",
        page: () => const ProductPreview(),
        transition: Transition.noTransition),

    ///CATEGORY
    GetPage(
      name: "/category",
      page: () => const CategoryScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/categoryInsert",
      page: () => const CategoryInsert(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/categoryView",
      page: () => const CategoryView(),
      transition: Transition.noTransition,
    ),

    ///DISCOUNT
    GetPage(
      name: "/discount",
      page: () => const DiscountScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/discountInsert",
      page: () => const DiscountInsert(),
      transition: Transition.noTransition,
    ),

    ///HISTORY
    GetPage(
      name: "/history",
      page: () => const OrderHistory(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/export",
      page: () => OrderExport(),
      transition: Transition.noTransition,
    ),

    ///HISTORY PAYMENT
    GetPage(
      name: "/historyPayment",
      page: () => const HistoryPayment(),
      transition: Transition.noTransition,
    ),

    ///ANALYTIC
    GetPage(
        name: "/analytic", page: () => const AnalyticScreen(), transition: Transition.noTransition),
  ];
}
