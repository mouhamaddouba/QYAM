import 'package:intl/intl.dart';

extension NumExtension on num {
  String get withComma => NumberFormat.decimalPattern().format(this);
}
