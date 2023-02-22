import 'package:fazmenu/features/addition/presentation/pages/addition_screen.dart';
import 'package:fazmenu/features/history/presentation/history_screen.dart';
import 'package:fazmenu/features/home/presentation/pages/home.dart';
import 'package:fazmenu/features/home/presentation/pages/splash.dart';
import 'package:fazmenu/features/product/presentation/product_screen.dart';
import 'package:fazmenu/features/settings/presentation/pages/settings_screen.dart';
import 'package:fazmenu/main.dart';
import 'package:get/get.dart';

class Routes {
  static const initial = "/splash";
  static final routes = [
    GetPage(name: "/", page: () => const MyApp()),
    GetPage(name: "/home", page: () => const Home(), transition: Transition.noTransition),
    GetPage(
        name: "/settings", page: () => const SettingsScreen(), transition: Transition.noTransition),
    GetPage(
        name: "/addition", page: () => const AdditionScreen(), transition: Transition.noTransition),
    GetPage(
        name: "/product", page: () => const ProductScreen(), transition: Transition.noTransition),
    GetPage(
        name: "/history", page: () => const HistoryScreen(), transition: Transition.noTransition),
    GetPage(name: "/splash", page: () => const Splash(), transition: Transition.noTransition),
  ];
}
