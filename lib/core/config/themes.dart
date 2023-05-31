import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData defaultThemes(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: FazColors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primaryContainer: FazColors.blue[900],
        primary: FazColors.blue[600]!,
        onPrimary: FazColors.blue[100]!,
        secondary: FazColors.green[400]!,
        onSecondary: FazColors.green[100]!,
        error: FazColors.pink[600]!,
        onError: FazColors.pink[500]!,
        background: FazColors.white,
        onBackground: FazColors.slate[600]!,
        surface: FazColors.white,
        onSurface: FazColors.slate[900]!,
      ),
      cardTheme: CardTheme(
        elevation: 3,
        color: FazColors.white,
        shadowColor: FazColors.slate[600],
        surfaceTintColor: FazColors.white,
        margin: const EdgeInsets.only(bottom: 10),
      ),
      appBarTheme: AppBarTheme(
        color: FazColors.blue[600]!,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18,
              color: FazColors.white,
              fontWeight: FontWeight.w400,
            ),
        iconTheme: const IconThemeData(
          color: FazColors.white,
          size: 20,
        ),
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleSpacing: 0,
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        side: const BorderSide(
            width: 1, strokeAlign: 0, style: BorderStyle.solid, color: FazColors.slate),
        splashRadius: 18,
        checkColor: MaterialStateProperty.all(
          FazColors.white,
        ),
        overlayColor: MaterialStateProperty.all(
          FazColors.slate[100],
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
            return FazColors.slate[600]!;
          },
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: FazColors.blue[600],
        foregroundColor: FazColors.white,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: FazColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        modalElevation: 0,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        bodyLarge: TextStyle(
          color: FazColors.slate[900],
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: FazColors.slate[700],
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: FazColors.slate[500],
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
      iconTheme: IconThemeData(
        color: FazColors.slate[600],
        size: 16,
      ),
      listTileTheme: ListTileThemeData(
        // contentPadding: EdgeInsets.zero,
        dense: true,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
        ),
        iconColor: FazColors.slate[600],
        minLeadingWidth: 0,
        style: ListTileStyle.drawer,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: FazColors.slate[400]!,
              strokeAlign: 0,
              width: 1,
            ),
          ),
          fixedSize: MaterialStateProperty.all(const Size(double.maxFinite, 40)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            FazColors.slate[500]!,
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return FazColors.white;
              }
              if (states.contains(MaterialState.disabled)) {
                return FazColors.slate[200]!;
              }
              if (states.contains(MaterialState.hovered)) {
                return FazColors.white;
              }
              if (states.contains(MaterialState.selected)) {
                return FazColors.blue[600]!;
              }
              return FazColors.white;
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          fixedSize: MaterialStateProperty.all(const Size(double.maxFinite, 40)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            FazColors.white,
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return FazColors.blue[300]!;
              }
              if (states.contains(MaterialState.disabled)) {
                return FazColors.slate[200]!;
              }
              if (states.contains(MaterialState.hovered)) {
                return FazColors.white;
              }
              if (states.contains(MaterialState.selected)) {
                return FazColors.blue[600]!;
              }
              return FazColors.blue[600]!;
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 16,
        trackColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return FazColors.white;
            }
            if (states.contains(MaterialState.disabled)) {
              return FazColors.slate[200]!;
            }
            if (states.contains(MaterialState.hovered)) {
              return FazColors.white;
            }
            if (states.contains(MaterialState.selected)) {
              return FazColors.blue[600]!;
            }
            return FazColors.white;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return FazColors.white;
            }
            if (states.contains(MaterialState.disabled)) {
              return FazColors.slate[200]!;
            }
            if (states.contains(MaterialState.hovered)) {
              return FazColors.white;
            }
            if (states.contains(MaterialState.selected)) {
              return FazColors.blue[600]!;
            }
            return FazColors.white;
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return FazColors.slate[600]!;
            }
            if (states.contains(MaterialState.disabled)) {
              return FazColors.slate[200]!;
            }
            if (states.contains(MaterialState.hovered)) {
              return FazColors.slate[600]!;
            }
            if (states.contains(MaterialState.selected)) {
              return FazColors.white;
            }
            return FazColors.slate[600]!;
          },
        ),
      ),
    );
  }
}
