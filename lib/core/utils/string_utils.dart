import 'package:intl/intl.dart';
import 'package:sumangalam/core/cubit/location/geo_location_cubit.dart';

String formatCurrency(double amount) {
  final NumberFormat format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
  return format.format(amount);
}

String getCoordinates(GeoLocationState state) {
  final latitude = state.latitude;
  final longitude = state.longitude;
  if(latitude == null || longitude == null) return '';
  return '$latitude, $longitude';
}

String formatAddress(GeoLocationState addressState) {
  final subLocality = addressState.placemark?.subLocality;
  final locality = addressState.placemark?.locality;
  final administrativeArea = addressState.placemark?.administrativeArea;
  final postalCode = addressState.placemark?.postalCode;
  final country = addressState.placemark?.country;
  final street = addressState.placemark?.street;
  final nonNullAddress = [
    street,
    subLocality,
    locality,
    administrativeArea,
    postalCode,
    country
  ].nonNulls.toList();
  return nonNullAddress.join(', ');
}