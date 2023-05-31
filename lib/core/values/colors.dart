import 'package:flutter/material.dart';

class FazColors {
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);

  static const MaterialColor slate = MaterialColor(
    _slate,
    <int, Color>{
      50: Color(0xFFF8FAFC),
      100: Color(0xFFF1F5F9),
      200: Color(0xFFE2E8F0),
      300: Color(0xFFCBD5E1),
      400: Color(0xFF94A3B8),
      500: Color(0xFF64748B),
      600: Color(0xFF475569),
      700: Color(_slate),
      800: Color(0xFF1E293B),
      900: Color(0xFF0F172A),
    },
  );
  static const MaterialColor gray = MaterialColor(
    _gray,
    <int, Color>{
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD1D5DB),
      400: Color(0xFF9CA3AF),
      500: Color(0xFF6B7280),
      600: Color(0xFF4B5563),
      700: Color(_gray),
      800: Color(0xFF1F2937),
      900: Color(0xFF111827),
    },
  );
  static const MaterialColor zinc = MaterialColor(
    _zinc,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF4F4F5),
      200: Color(0xFFE4E4E7),
      300: Color(0xFFD4D4D8),
      400: Color(0xFFA1A1AA),
      500: Color(0xFF71717A),
      600: Color(0xFF52525B),
      700: Color(_zinc),
      800: Color(0xFF27272A),
      900: Color(0xFF18181B),
    },
  );
  static const MaterialColor neutral = MaterialColor(
    _neutral,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFE5E5E5),
      300: Color(0xFFD4D4D4),
      400: Color(0xFFA3A3A3),
      500: Color(0xFF737373),
      600: Color(0xFF525252),
      700: Color(_neutral),
      800: Color(0xFF262626),
      900: Color(0xFF171717),
    },
  );
  static const MaterialColor stone = MaterialColor(
    _stone,
    <int, Color>{
      50: Color(0xFFFAFAF9),
      100: Color(0xFFF5F5F4),
      200: Color(0xFFE7E5E4),
      300: Color(0xFFD6D3D1),
      400: Color(0xFFA8A29E),
      500: Color(0xFF78716C),
      600: Color(0xFF57534E),
      700: Color(_stone),
      800: Color(0xFF292524),
      900: Color(0xFF171717),
    },
  );
  static const MaterialColor red = MaterialColor(
    _red,
    <int, Color>{
      50: Color(0xFFFEF2F2),
      100: Color(0xFFFEE2E2),
      200: Color(0xFFFECACA),
      300: Color(0xFFFCA5A5),
      400: Color(0xFFF87171),
      500: Color(0xFFEF4444),
      600: Color(0xFFDC2626),
      700: Color(_red),
      800: Color(0xFF991B1B),
      900: Color(0xFF7F1D1D),
    },
  );
  static const MaterialColor orange = MaterialColor(
    _orange,
    <int, Color>{
      50: Color(0xFFFFF7ED),
      100: Color(0xFFFFEDD5),
      200: Color(0xFFFED7AA),
      300: Color(0xFFFDBA74),
      400: Color(0xFFFB923C),
      500: Color(0xFFF97316),
      600: Color(0xFFEA580C),
      700: Color(_orange),
      800: Color(0xFF9A3412),
      900: Color(0xFF7C2D12),
    },
  );
  static const MaterialColor amber = MaterialColor(
    _amber,
    <int, Color>{
      50: Color(0xFFFFFBEB),
      100: Color(0xFFFEF3C7),
      200: Color(0xFFFDE68A),
      300: Color(0xFFFCD34D),
      400: Color(0xFFFBBF24),
      500: Color(0xFFF59E0B),
      600: Color(0xFFD97706),
      700: Color(_amber),
      800: Color(0xFF92400E),
      900: Color(0xFF78350F),
    },
  );
  static const MaterialColor yellow = MaterialColor(
    _yellow,
    <int, Color>{
      50: Color(0xFFFEFCE8),
      100: Color(0xFFFEF9C3),
      200: Color(0xFFFEF08A),
      300: Color(0xFFFDE047),
      400: Color(0xFFFACC15),
      500: Color(0xFFEAB308),
      600: Color(0xFFCA8A04),
      700: Color(_yellow),
      800: Color(0xFF854D0E),
      900: Color(0xFF713F12),
    },
  );
  static const MaterialColor lime = MaterialColor(
    _lime,
    <int, Color>{
      50: Color(0xFFF7FEE7),
      100: Color(0xFFECFCCB),
      200: Color(0xFFD9F99D),
      300: Color(0xFFBEF264),
      400: Color(0xFFA3E635),
      500: Color(0xFF84CC16),
      600: Color(0xFF65A30D),
      700: Color(_lime),
      800: Color(0xFF3F6212),
      900: Color(0xFF365314),
    },
  );
  static const MaterialColor green = MaterialColor(
    _green,
    <int, Color>{
      50: Color(0xFFF0FDF4),
      100: Color(0xFFDCFCE7),
      200: Color(0xFFBBF7D0),
      300: Color(0xFF86EFAC),
      400: Color(0xFF4ADE80),
      500: Color(0xFF22C55E),
      600: Color(0xFF16A34A),
      700: Color(_green),
      800: Color(0xFF166534),
      900: Color(0xFF14532D),
    },
  );
  static const MaterialColor emerald = MaterialColor(
    _emerald,
    <int, Color>{
      50: Color(0xFFECFDF5),
      100: Color(0xFFD1FAE5),
      200: Color(0xFFD1FAE5),
      300: Color(0xFF6EE7B7),
      400: Color(0xFF34D399),
      500: Color(0xFF10B981),
      600: Color(0xFF059669),
      700: Color(_emerald),
      800: Color(0xFF065F46),
      900: Color(0xFF064E3B),
    },
  );
  static const MaterialColor teal = MaterialColor(
    _teal,
    <int, Color>{
      50: Color(0xFFF0FDFA),
      100: Color(0xFFCCFBF1),
      200: Color(0xFF99F6E4),
      300: Color(0xFF5EEAD4),
      400: Color(0xFF2DD4BF),
      500: Color(0xFF14B8A6),
      600: Color(0xFF0D9488),
      700: Color(_teal),
      800: Color(0xFF115E59),
      900: Color(0xFF134E4A),
    },
  );
  static const MaterialColor cyan = MaterialColor(
    _cyan,
    <int, Color>{
      50: Color(0xFFECFEFF),
      100: Color(0xFFCFFAFE),
      200: Color(0xFFA5F3FC),
      300: Color(0xFF67E8F9),
      400: Color(0xFF22D3EE),
      500: Color(0xFF06B6D4),
      600: Color(0xFF0891B2),
      700: Color(_cyan),
      800: Color(0xFF155E75),
      900: Color(0xFF164E63),
    },
  );
  static const MaterialColor sky = MaterialColor(
    _sky,
    <int, Color>{
      50: Color(0xFFF0F9FF),
      100: Color(0xFFE0F2FE),
      200: Color(0xFFBAE6FD),
      300: Color(0xFF7DD3FC),
      400: Color(0xFF38BDF8),
      500: Color(0xFF0EA5E9),
      600: Color(0xFF0284C7),
      700: Color(_sky),
      800: Color(0xFF075985),
      900: Color(0xFF0C4A6E),
    },
  );
  static const MaterialColor blue = MaterialColor(
    _blue,
    <int, Color>{
      50: Color(0xFFEFF6FF),
      100: Color(0xFFDBEAFE),
      200: Color(0xFFBFDBFE),
      300: Color(0xFF93C5FD),
      400: Color(0xFF60A5FA),
      500: Color(0xFF3B82F6),
      600: Color(0xFF2563EB),
      700: Color(_blue),
      800: Color(0xFF1E40AF),
      900: Color(0xFF1E3A8A),
    },
  );
  static const MaterialColor indigo = MaterialColor(
    _indigo,
    <int, Color>{
      50: Color(0xFFEEF2FF),
      100: Color(0xFFE0E7FF),
      200: Color(0xFFC7D2FE),
      300: Color(0xFFA5B4FC),
      400: Color(0xFF818CF8),
      500: Color(0xFF6366F1),
      600: Color(0xFF4F46E5),
      700: Color(_indigo),
      800: Color(0xFF3730A3),
      900: Color(0xFF312E81),
    },
  );
  static const MaterialColor violet = MaterialColor(
    _violet,
    <int, Color>{
      50: Color(0xFFF5F3FF),
      100: Color(0xFFEDE9FE),
      200: Color(0xFFDDD6FE),
      300: Color(0xFFC4B5FD),
      400: Color(0xFFA78BFA),
      500: Color(0xFF8B5CF6),
      600: Color(0xFF7C3AED),
      700: Color(_violet),
      800: Color(0xFF5B21B6),
      900: Color(0xFF4C1D95),
    },
  );
  static const MaterialColor purple = MaterialColor(
    _purple,
    <int, Color>{
      50: Color(0xFFFAF5FF),
      100: Color(0xFFF3E8FF),
      200: Color(0xFFE9D5FF),
      300: Color(0xFFD8B4FE),
      400: Color(0xFFC084FC),
      500: Color(0xFFA855F7),
      600: Color(0xFF9333EA),
      700: Color(_purple),
      800: Color(0xFF6B21A8),
      900: Color(0xFF581C87),
    },
  );
  static const MaterialColor fuchsia = MaterialColor(
    _fuchsia,
    <int, Color>{
      50: Color(0xFFFDF4FF),
      100: Color(0xFFFAE8FF),
      200: Color(0xFFF5D0FE),
      300: Color(0xFFF0ABFC),
      400: Color(0xFFE879F9),
      500: Color(0xFFD946EF),
      600: Color(0xFFC026D3),
      700: Color(_fuchsia),
      800: Color(0xFF86198F),
      900: Color(0xFF701A75),
    },
  );
  static const MaterialColor pink = MaterialColor(
    _pink,
    <int, Color>{
      50: Color(0xFFFDF2F8),
      100: Color(0xFFFCE7F3),
      200: Color(0xFFFBCFE8),
      300: Color(0xFFF9A8D4),
      400: Color(0xFFF472B6),
      500: Color(0xFFEC4899),
      600: Color(0xFFDB2777),
      700: Color(_pink),
      800: Color(0xFF9D174D),
      900: Color(0xFF831843),
    },
  );
  static const MaterialColor rose = MaterialColor(
    _rose,
    <int, Color>{
      50: Color(0xFFFFF1F2),
      100: Color(0xFFFFE4E6),
      200: Color(0xFFFECDD3),
      300: Color(0xFFFDA4AF),
      400: Color(0xFFFB7185),
      500: Color(0xFFF43F5E),
      600: Color(0xFFE11D48),
      700: Color(_rose),
      800: Color(0xFF9F1239),
      900: Color(0xFF881337),
    },
  );

  static const int _slate = 0xFF334155;
  static const int _gray = 0xFF374151;
  static const int _zinc = 0xFF3F3F46;
  static const int _neutral = 0xFF404040;
  static const int _stone = 0xFF44403C;
  static const int _red = 0xFFB91C1C;
  static const int _orange = 0xFFC2410C;
  static const int _amber = 0xFFB45309;
  static const int _yellow = 0xFFA16207;
  static const int _lime = 0xFF4D7C0F;
  static const int _green = 0xFF15803D;
  static const int _emerald = 0xFF047857;
  static const int _teal = 0xFF0F766E;
  static const int _cyan = 0xFF0E7490;
  static const int _sky = 0xFF0369A1;
  static const int _blue = 0xFF1D4ED8;
  static const int _indigo = 0xFF4338CA;
  static const int _violet = 0xFF6D28D9;
  static const int _purple = 0xFF7E22CE;
  static const int _fuchsia = 0xFFA21CAF;
  static const int _pink = 0xFFBE185D;
  static const int _rose = 0xFFBE123C;
}
