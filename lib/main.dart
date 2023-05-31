import 'package:fazmenu/core/components/custom_scroll_behavior.dart';
import 'package:fazmenu/core/config/initial_binding.dart';
import 'package:fazmenu/core/config/routes.dart';
import 'package:fazmenu/core/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'Fazmenu',
        smartManagement: SmartManagement.full,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: Themes.defaultThemes(context),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.initial,
        getPages: Routes.routes,
        initialBinding: InitialBinding(),
      ),
    );
  }
}

//test
