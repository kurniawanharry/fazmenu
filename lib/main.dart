import 'package:fazmenu/core/components/custom_scroll_behavior.dart';
import 'package:fazmenu/core/config/initial_binding.dart';
import 'package:fazmenu/core/config/routes.dart';
import 'package:fazmenu/core/values/colors.dart';
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
        smartManagement: SmartManagement.onlyBuilder,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.blue,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          checkboxTheme: CheckboxThemeData(
            splashRadius: 18,
            checkColor: MaterialStateProperty.all(
              FazColors.white,
            ),
            overlayColor: MaterialStateProperty.all(
              FazColors.white,
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return FazColors.blue[600]!;
                }
                if (states.contains(MaterialState.disabled)) {
                  return FazColors.blue[600]!;
                }
                if (states.contains(MaterialState.hovered)) {
                  return FazColors.blue[600]!;
                }
                if (states.contains(MaterialState.selected)) {
                  return FazColors.blue[600]!;
                }
                return FazColors.neutral[600]!;
              },
            ),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.initial,
        getPages: Routes.routes,
        initialBinding: InitialBinding(),
      ),
    );
  }
}
