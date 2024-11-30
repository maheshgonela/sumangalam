// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeoLocationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get hasPermission => throw _privateConstructorUsedError;
  Placemark? get placemark => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeoLocationStateCopyWith<GeoLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationStateCopyWith<$Res> {
  factory $GeoLocationStateCopyWith(
          GeoLocationState value, $Res Function(GeoLocationState) then) =
      _$GeoLocationStateCopyWithImpl<$Res, GeoLocationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      String? error,
      bool hasPermission,
      Placemark? placemark,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$GeoLocationStateCopyWithImpl<$Res, $Val extends GeoLocationState>
    implements $GeoLocationStateCopyWith<$Res> {
  _$GeoLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? error = freezed,
    Object? hasPermission = null,
    Object? placemark = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      placemark: freezed == placemark
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoLocationStateImplCopyWith<$Res>
    implements $GeoLocationStateCopyWith<$Res> {
  factory _$$GeoLocationStateImplCopyWith(_$GeoLocationStateImpl value,
          $Res Function(_$GeoLocationStateImpl) then) =
      __$$GeoLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      String? error,
      bool hasPermission,
      Placemark? placemark,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$GeoLocationStateImplCopyWithImpl<$Res>
    extends _$GeoLocationStateCopyWithImpl<$Res, _$GeoLocationStateImpl>
    implements _$$GeoLocationStateImplCopyWith<$Res> {
  __$$GeoLocationStateImplCopyWithImpl(_$GeoLocationStateImpl _value,
      $Res Function(_$GeoLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? error = freezed,
    Object? hasPermission = null,
    Object? placemark = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$GeoLocationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      placemark: freezed == placemark
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$GeoLocationStateImpl implements _GeoLocationState {
  const _$GeoLocationStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      this.error,
      required this.hasPermission,
      this.placemark,
      this.latitude,
      this.longitude});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final String? error;
  @override
  final bool hasPermission;
  @override
  final Placemark? placemark;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'GeoLocationState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, hasPermission: $hasPermission, placemark: $placemark, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoLocationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.hasPermission, hasPermission) ||
                other.hasPermission == hasPermission) &&
            (identical(other.placemark, placemark) ||
                other.placemark == placemark) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, error,
      hasPermission, placemark, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoLocationStateImplCopyWith<_$GeoLocationStateImpl> get copyWith =>
      __$$GeoLocationStateImplCopyWithImpl<_$GeoLocationStateImpl>(
          this, _$identity);
}

abstract class _GeoLocationState implements GeoLocationState {
  const factory _GeoLocationState(
      {required final bool isLoading,
      required final bool isSuccess,
      final String? error,
      required final bool hasPermission,
      final Placemark? placemark,
      final double? latitude,
      final double? longitude}) = _$GeoLocationStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get error;
  @override
  bool get hasPermission;
  @override
  Placemark? get placemark;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$GeoLocationStateImplCopyWith<_$GeoLocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
