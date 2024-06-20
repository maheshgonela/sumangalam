import 'package:intl/intl.dart';

import 'package:sumangalam/core/core.dart';

class StringUtils {
  // static String obUtilityUrl(String? imageId) {
  //   if (imageId!.doesNotHaveValue) return '';
  //   return '${Urls.baseUrl}/utility/ShowImage?id=$imageId';
  // }
}

String formatCurrency(double amount) {
  final NumberFormat format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
  return format.format(amount);
}

