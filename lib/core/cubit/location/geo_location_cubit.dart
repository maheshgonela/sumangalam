import 'package:sumangalam/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'geo_location_cubit.freezed.dart';

@injectable
class GeoLocationCubit extends AppBaseCubit<GeoLocationState> {
  GeoLocationCubit() : super(GeoLocationState.initial());

  void fetchLocation() async {
    emitSafeState(
        GeoLocationState.initial().copyWith(isLoading: true, isSuccess: false));
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission().then((value) {
        fetchLocation();
      });
    }
    final hasPermissions = await _checkForLocationPermission();
    if (hasPermissions) {
      Geolocator.getCurrentPosition(locationSettings: const LocationSettings(accuracy: LocationAccuracy.high))
          .then((position) async {
        final placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          emitSafeState(state.copyWith(
              isLoading: false,
              isSuccess: true,
              hasPermission: true,
              placemark: placemarks.first,
              latitude: position.latitude,
              longitude: position.longitude));
        } else {
          emitSafeState(state.copyWith(
            isLoading: false,
            isSuccess: false,
            hasPermission: true,
            error: '102',
          ));
        }
      });
    }
  }

  Future<bool> _checkForLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}

@freezed
class GeoLocationState with _$GeoLocationState {
  const factory GeoLocationState({
    required bool isLoading,
    required bool isSuccess,
    String? error,
    required bool hasPermission,
    Placemark? placemark,
    double? latitude,
    double? longitude,
  }) = _GeoLocationState;

  factory GeoLocationState.initial() => const GeoLocationState(
        hasPermission: false,
        isLoading: false,
        isSuccess: false,
      );
}
