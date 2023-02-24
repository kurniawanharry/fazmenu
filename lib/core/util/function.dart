import 'package:intl/intl.dart';

String formatCurrency(int? amount) {
  return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(amount ?? 0);
}

String useAblePhoneNumberUser(String value, {bool alt = false, bool complete = true}) {
  RegExp regex = complete
      ? alt
          ? RegExp(r'^62|^[^1-9]|^\+62|[^0-9]')
          : RegExp(r'^62|^[^8]|^\+62|[^0-9]')
      : RegExp(r'^62|^[^8|^0]|^\+62|[^0-9]');
  value = value.replaceAll(regex, '');
  do {
    value = value.replaceAll(regex, '');
  } while (regex.hasMatch(value));

  if (value.isNotEmpty) {
    if (value[0] == '0') {
      if (value.length > 12) {
        return value.replaceAllMapped(
            RegExp(r'(\d{4})(\d{4})(\d{4})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}-${m[4]}");
      } else if (value.length > 8) {
        return value.replaceAllMapped(
            RegExp(r'(\d{4})(\d{4})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
      } else if (value.length > 4) {
        return value.replaceAllMapped(RegExp(r'(\d{4})(\d+)'), (Match m) => "${m[1]}-${m[2]}");
      } else {
        return value;
      }
    } else {
      if (value.length > 11) {
        return value.replaceAllMapped(
            RegExp(r'(\d{3})(\d{4})(\d{4})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}-${m[4]}");
      } else if (value.length > 7) {
        return value.replaceAllMapped(
            RegExp(r'(\d{3})(\d{4})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
      } else if (value.length > 3) {
        return value.replaceAllMapped(RegExp(r'(\d{3})(\d+)'), (Match m) => "${m[1]}-${m[2]}");
      } else {
        return value;
      }
    }
  } else {
    return value;
  }
}
