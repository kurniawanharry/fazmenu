import 'package:fazmenu/core/values/enums.dart';

String orderTypeHistory(OrderType type) {
  switch (type) {
    case OrderType.ongoing:
      return 'Berlangsung';
    case OrderType.success:
      return 'Selesai';
    case OrderType.cancel:
      return 'Batal';
    default:
  }
  return '';
}
