import 'package:intl/intl.dart';

class NumberFormatter {
  static final _numberFormat = NumberFormat('#,##0', 'en_US');

  static String formatPrice(num price) {
    try {
      return _numberFormat.format(price);
    } catch (_) {
      return price.toString();
    }
  }

  static String formatCurrency(num amount, String currency) {
    try {
      return '$currency ${formatPrice(amount)}';
    } catch (_) {
      return '$currency $amount';
    }
  }

  static String formatInstallment(num amount, String currency, int years) {
    try {
      return '$currency ${formatPrice(amount)} / month over $years years';
    } catch (_) {
      return '$currency $amount / month over $years years';
    }
  }
}
