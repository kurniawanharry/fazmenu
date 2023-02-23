import 'package:intl/intl.dart';

String formatCurrency(int? amount) {
  return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(amount ?? 0);
}
