

import 'package:intl/intl.dart';

bool isCalled = false;

String formatAmount(num amount) {
  final formatter =
      NumberFormat.decimalPattern(); // Default locale-based format
  return formatter.format(amount);
}
