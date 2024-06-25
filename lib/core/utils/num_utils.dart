import 'package:sumangalam/core/core.dart';

abstract class NumUtils {
  static String toVal(num? value) {
    if(value.isNull) return '';
    return value!.toStringAsFixed(2);
  }
}