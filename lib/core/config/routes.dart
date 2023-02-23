import 'package:fazmenu/features/addition/presentation/pages/addition_insert.dart';
import 'package:fazmenu/features/addition/presentation/pages/addition_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/arrangement_screen.dart';
import 'package:fazmenu/features/arrangement/presentation/pages/cover_menu_screen.dart';
import 'package:fazmenu/features/history/presentation/pages/history_screen.dart';
import 'package:fazmenu/features/home/presentation/pages/home.dart';
import 'package:fazmenu/features/home/presentation/pages/splash.dart';
import 'package:fazmenu/features/product/presentation/product_insert.dart';
import 'package:fazmenu/features/product/presentation/product_screen.dart';
import 'package:fazmenu/main.dart';
import 'package:get/get.dart';

class Routes {
  static const initial = "/splash";
  static final routes = [
    GetPage(name: "/", page: () => const MyApp()),
    GetPage(name: "/home", page: () => const Home(), transition: Transition.noTransition),
    GetPage(
        name: "/settings",
        page: () => const ArrangementScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: "/coverMenu",
        page: () => const CoverMenuScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: "/addition", page: () => const AdditionScreen(), transition: Transition.noTransition),
    GetPage(
        name: "/insertAddition",
        page: () => const AdditionInsert(),
        transition: Transition.noTransition),
    GetPage(
        name: "/product", page: () => const ProductScreen(), transition: Transition.noTransition),
    GetPage(
        name: "/productInsert",
        page: () => const ProductInsert(),
        transition: Transition.noTransition),
    GetPage(
        name: "/history", page: () => const HistoryScreen(), transition: Transition.noTransition),
    GetPage(name: "/splash", page: () => const Splash(), transition: Transition.noTransition),
  ];
}
