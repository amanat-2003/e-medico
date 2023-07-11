import 'package:intl/intl.dart';

final indianRupeesFormat = NumberFormat.currency(
  name: "INR",
  locale: 'en_IN',
  decimalDigits: 0,
  symbol: '₹',
);

extension RupeesFormatter on int {
  String inRupeesFormat() {
    return indianRupeesFormat.format(this);
  }
}
