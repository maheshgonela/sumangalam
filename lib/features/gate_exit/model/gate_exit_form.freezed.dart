// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_exit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateExitForm _$GateExitFormFromJson(Map<String, dynamic> json) {
  return _GateExitForm.fromJson(json);
}

/// @nodoc
mixin _$GateExitForm {
  @JsonKey(name: 'name')
  String? get exitno => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_exit_date', toJson: _dateToJson)
  String? get exitdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  String? get createdtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dc_no')
  String? get dcNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'so_number')
  String? get sONO => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order')
  String? get poNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_weight_with_material')
  double? get vehicleWithMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_weight_without_material')
  double? get vehicleWithOutMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_weight')
  double? get actualWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
  String? get vechileMaterialUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_weight_without_material_photo', includeToJson: false)
  String? get vechileWithoutMaterialUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_image', includeToJson: false)
  String? get vehicleImageUrl => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleImage => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleWeightWithMaterialPhoto =>
      throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleWeightWithOutMaterialPhoto =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_no')
  String? get vehicleNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_mobile_no')
  String? get driverMobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GateExitFormCopyWith<GateExitForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateExitFormCopyWith<$Res> {
  factory $GateExitFormCopyWith(
          GateExitForm value, $Res Function(GateExitForm) then) =
      _$GateExitFormCopyWithImpl<$Res, GateExitForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? exitno,
      @JsonKey(name: 'gate_exit_date', toJson: _dateToJson) String? exitdate,
      @JsonKey(name: 'created_time') String? createdtime,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'dc_no') String? dcNo,
      @JsonKey(name: 'so_number') String? sONO,
      @JsonKey(name: 'purchase_order') String? poNumber,
      @JsonKey(name: 'vehicle_weight_with_material')
      double? vehicleWithMaterial,
      @JsonKey(name: 'vehicle_weight_without_material')
      double? vehicleWithOutMaterial,
      @JsonKey(name: 'actual_weight') double? actualWeight,
      @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
      String? vechileMaterialUrl,
      @JsonKey(
          name: 'vehicle_weight_without_material_photo', includeToJson: false)
      String? vechileWithoutMaterialUrl,
      @JsonKey(name: 'vehicle_image', includeToJson: false)
      String? vehicleImageUrl,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleWeightWithMaterialPhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleWeightWithOutMaterialPhoto,
      @JsonKey(name: 'vehicle_no') String? vehicleNo,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_mobile_no') String? driverMobileNo,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$GateExitFormCopyWithImpl<$Res, $Val extends GateExitForm>
    implements $GateExitFormCopyWith<$Res> {
  _$GateExitFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exitno = freezed,
    Object? exitdate = freezed,
    Object? createdtime = freezed,
    Object? customerName = freezed,
    Object? dcNo = freezed,
    Object? sONO = freezed,
    Object? poNumber = freezed,
    Object? vehicleWithMaterial = freezed,
    Object? vehicleWithOutMaterial = freezed,
    Object? actualWeight = freezed,
    Object? vechileMaterialUrl = freezed,
    Object? vechileWithoutMaterialUrl = freezed,
    Object? vehicleImageUrl = freezed,
    Object? vehicleImage = freezed,
    Object? vehicleWeightWithMaterialPhoto = freezed,
    Object? vehicleWeightWithOutMaterialPhoto = freezed,
    Object? vehicleNo = freezed,
    Object? driverName = freezed,
    Object? driverMobileNo = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      exitno: freezed == exitno
          ? _value.exitno
          : exitno // ignore: cast_nullable_to_non_nullable
              as String?,
      exitdate: freezed == exitdate
          ? _value.exitdate
          : exitdate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdtime: freezed == createdtime
          ? _value.createdtime
          : createdtime // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      dcNo: freezed == dcNo
          ? _value.dcNo
          : dcNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sONO: freezed == sONO
          ? _value.sONO
          : sONO // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleWithMaterial: freezed == vehicleWithMaterial
          ? _value.vehicleWithMaterial
          : vehicleWithMaterial // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleWithOutMaterial: freezed == vehicleWithOutMaterial
          ? _value.vehicleWithOutMaterial
          : vehicleWithOutMaterial // ignore: cast_nullable_to_non_nullable
              as double?,
      actualWeight: freezed == actualWeight
          ? _value.actualWeight
          : actualWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      vechileMaterialUrl: freezed == vechileMaterialUrl
          ? _value.vechileMaterialUrl
          : vechileMaterialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vechileWithoutMaterialUrl: freezed == vechileWithoutMaterialUrl
          ? _value.vechileWithoutMaterialUrl
          : vechileWithoutMaterialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImageUrl: freezed == vehicleImageUrl
          ? _value.vehicleImageUrl
          : vehicleImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImage: freezed == vehicleImage
          ? _value.vehicleImage
          : vehicleImage // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleWeightWithMaterialPhoto: freezed == vehicleWeightWithMaterialPhoto
          ? _value.vehicleWeightWithMaterialPhoto
          : vehicleWeightWithMaterialPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleWeightWithOutMaterialPhoto: freezed ==
              vehicleWeightWithOutMaterialPhoto
          ? _value.vehicleWeightWithOutMaterialPhoto
          : vehicleWeightWithOutMaterialPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleNo: freezed == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverMobileNo: freezed == driverMobileNo
          ? _value.driverMobileNo
          : driverMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateExitFormImplCopyWith<$Res>
    implements $GateExitFormCopyWith<$Res> {
  factory _$$GateExitFormImplCopyWith(
          _$GateExitFormImpl value, $Res Function(_$GateExitFormImpl) then) =
      __$$GateExitFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? exitno,
      @JsonKey(name: 'gate_exit_date', toJson: _dateToJson) String? exitdate,
      @JsonKey(name: 'created_time') String? createdtime,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'dc_no') String? dcNo,
      @JsonKey(name: 'so_number') String? sONO,
      @JsonKey(name: 'purchase_order') String? poNumber,
      @JsonKey(name: 'vehicle_weight_with_material')
      double? vehicleWithMaterial,
      @JsonKey(name: 'vehicle_weight_without_material')
      double? vehicleWithOutMaterial,
      @JsonKey(name: 'actual_weight') double? actualWeight,
      @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
      String? vechileMaterialUrl,
      @JsonKey(
          name: 'vehicle_weight_without_material_photo', includeToJson: false)
      String? vechileWithoutMaterialUrl,
      @JsonKey(name: 'vehicle_image', includeToJson: false)
      String? vehicleImageUrl,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleWeightWithMaterialPhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleWeightWithOutMaterialPhoto,
      @JsonKey(name: 'vehicle_no') String? vehicleNo,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_mobile_no') String? driverMobileNo,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$$GateExitFormImplCopyWithImpl<$Res>
    extends _$GateExitFormCopyWithImpl<$Res, _$GateExitFormImpl>
    implements _$$GateExitFormImplCopyWith<$Res> {
  __$$GateExitFormImplCopyWithImpl(
      _$GateExitFormImpl _value, $Res Function(_$GateExitFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exitno = freezed,
    Object? exitdate = freezed,
    Object? createdtime = freezed,
    Object? customerName = freezed,
    Object? dcNo = freezed,
    Object? sONO = freezed,
    Object? poNumber = freezed,
    Object? vehicleWithMaterial = freezed,
    Object? vehicleWithOutMaterial = freezed,
    Object? actualWeight = freezed,
    Object? vechileMaterialUrl = freezed,
    Object? vechileWithoutMaterialUrl = freezed,
    Object? vehicleImageUrl = freezed,
    Object? vehicleImage = freezed,
    Object? vehicleWeightWithMaterialPhoto = freezed,
    Object? vehicleWeightWithOutMaterialPhoto = freezed,
    Object? vehicleNo = freezed,
    Object? driverName = freezed,
    Object? driverMobileNo = freezed,
    Object? status = freezed,
  }) {
    return _then(_$GateExitFormImpl(
      exitno: freezed == exitno
          ? _value.exitno
          : exitno // ignore: cast_nullable_to_non_nullable
              as String?,
      exitdate: freezed == exitdate
          ? _value.exitdate
          : exitdate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdtime: freezed == createdtime
          ? _value.createdtime
          : createdtime // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      dcNo: freezed == dcNo
          ? _value.dcNo
          : dcNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sONO: freezed == sONO
          ? _value.sONO
          : sONO // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleWithMaterial: freezed == vehicleWithMaterial
          ? _value.vehicleWithMaterial
          : vehicleWithMaterial // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleWithOutMaterial: freezed == vehicleWithOutMaterial
          ? _value.vehicleWithOutMaterial
          : vehicleWithOutMaterial // ignore: cast_nullable_to_non_nullable
              as double?,
      actualWeight: freezed == actualWeight
          ? _value.actualWeight
          : actualWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      vechileMaterialUrl: freezed == vechileMaterialUrl
          ? _value.vechileMaterialUrl
          : vechileMaterialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vechileWithoutMaterialUrl: freezed == vechileWithoutMaterialUrl
          ? _value.vechileWithoutMaterialUrl
          : vechileWithoutMaterialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImageUrl: freezed == vehicleImageUrl
          ? _value.vehicleImageUrl
          : vehicleImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImage: freezed == vehicleImage
          ? _value.vehicleImage
          : vehicleImage // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleWeightWithMaterialPhoto: freezed == vehicleWeightWithMaterialPhoto
          ? _value.vehicleWeightWithMaterialPhoto
          : vehicleWeightWithMaterialPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleWeightWithOutMaterialPhoto: freezed ==
              vehicleWeightWithOutMaterialPhoto
          ? _value.vehicleWeightWithOutMaterialPhoto
          : vehicleWeightWithOutMaterialPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleNo: freezed == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverMobileNo: freezed == driverMobileNo
          ? _value.driverMobileNo
          : driverMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateExitFormImpl implements _GateExitForm {
  _$GateExitFormImpl(
      {@JsonKey(name: 'name') this.exitno,
      @JsonKey(name: 'gate_exit_date', toJson: _dateToJson) this.exitdate,
      @JsonKey(name: 'created_time') this.createdtime,
      @JsonKey(name: 'customer_name') this.customerName,
      @JsonKey(name: 'dc_no') this.dcNo,
      @JsonKey(name: 'so_number') this.sONO,
      @JsonKey(name: 'purchase_order') this.poNumber,
      @JsonKey(name: 'vehicle_weight_with_material') this.vehicleWithMaterial,
      @JsonKey(name: 'vehicle_weight_without_material')
      this.vehicleWithOutMaterial,
      @JsonKey(name: 'actual_weight') this.actualWeight,
      @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
      this.vechileMaterialUrl,
      @JsonKey(
          name: 'vehicle_weight_without_material_photo', includeToJson: false)
      this.vechileWithoutMaterialUrl,
      @JsonKey(name: 'vehicle_image', includeToJson: false)
      this.vehicleImageUrl,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehicleImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehicleWeightWithMaterialPhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehicleWeightWithOutMaterialPhoto,
      @JsonKey(name: 'vehicle_no') this.vehicleNo,
      @JsonKey(name: 'driver_name') this.driverName,
      @JsonKey(name: 'driver_mobile_no') this.driverMobileNo,
      @JsonKey(name: 'status') this.status});

  factory _$GateExitFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateExitFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? exitno;
  @override
  @JsonKey(name: 'gate_exit_date', toJson: _dateToJson)
  final String? exitdate;
  @override
  @JsonKey(name: 'created_time')
  final String? createdtime;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'dc_no')
  final String? dcNo;
  @override
  @JsonKey(name: 'so_number')
  final String? sONO;
  @override
  @JsonKey(name: 'purchase_order')
  final String? poNumber;
  @override
  @JsonKey(name: 'vehicle_weight_with_material')
  final double? vehicleWithMaterial;
  @override
  @JsonKey(name: 'vehicle_weight_without_material')
  final double? vehicleWithOutMaterial;
  @override
  @JsonKey(name: 'actual_weight')
  final double? actualWeight;
  @override
  @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
  final String? vechileMaterialUrl;
  @override
  @JsonKey(name: 'vehicle_weight_without_material_photo', includeToJson: false)
  final String? vechileWithoutMaterialUrl;
  @override
  @JsonKey(name: 'vehicle_image', includeToJson: false)
  final String? vehicleImageUrl;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehicleImage;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehicleWeightWithMaterialPhoto;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehicleWeightWithOutMaterialPhoto;
  @override
  @JsonKey(name: 'vehicle_no')
  final String? vehicleNo;
  @override
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @override
  @JsonKey(name: 'driver_mobile_no')
  final String? driverMobileNo;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'GateExitForm(exitno: $exitno, exitdate: $exitdate, createdtime: $createdtime, customerName: $customerName, dcNo: $dcNo, sONO: $sONO, poNumber: $poNumber, vehicleWithMaterial: $vehicleWithMaterial, vehicleWithOutMaterial: $vehicleWithOutMaterial, actualWeight: $actualWeight, vechileMaterialUrl: $vechileMaterialUrl, vechileWithoutMaterialUrl: $vechileWithoutMaterialUrl, vehicleImageUrl: $vehicleImageUrl, vehicleImage: $vehicleImage, vehicleWeightWithMaterialPhoto: $vehicleWeightWithMaterialPhoto, vehicleWeightWithOutMaterialPhoto: $vehicleWeightWithOutMaterialPhoto, vehicleNo: $vehicleNo, driverName: $driverName, driverMobileNo: $driverMobileNo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateExitFormImpl &&
            (identical(other.exitno, exitno) || other.exitno == exitno) &&
            (identical(other.exitdate, exitdate) ||
                other.exitdate == exitdate) &&
            (identical(other.createdtime, createdtime) ||
                other.createdtime == createdtime) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.dcNo, dcNo) || other.dcNo == dcNo) &&
            (identical(other.sONO, sONO) || other.sONO == sONO) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.vehicleWithMaterial, vehicleWithMaterial) ||
                other.vehicleWithMaterial == vehicleWithMaterial) &&
            (identical(other.vehicleWithOutMaterial, vehicleWithOutMaterial) ||
                other.vehicleWithOutMaterial == vehicleWithOutMaterial) &&
            (identical(other.actualWeight, actualWeight) ||
                other.actualWeight == actualWeight) &&
            (identical(other.vechileMaterialUrl, vechileMaterialUrl) ||
                other.vechileMaterialUrl == vechileMaterialUrl) &&
            (identical(other.vechileWithoutMaterialUrl,
                    vechileWithoutMaterialUrl) ||
                other.vechileWithoutMaterialUrl == vechileWithoutMaterialUrl) &&
            (identical(other.vehicleImageUrl, vehicleImageUrl) ||
                other.vehicleImageUrl == vehicleImageUrl) &&
            (identical(other.vehicleImage, vehicleImage) ||
                other.vehicleImage == vehicleImage) &&
            (identical(other.vehicleWeightWithMaterialPhoto,
                    vehicleWeightWithMaterialPhoto) ||
                other.vehicleWeightWithMaterialPhoto ==
                    vehicleWeightWithMaterialPhoto) &&
            (identical(other.vehicleWeightWithOutMaterialPhoto,
                    vehicleWeightWithOutMaterialPhoto) ||
                other.vehicleWeightWithOutMaterialPhoto ==
                    vehicleWeightWithOutMaterialPhoto) &&
            (identical(other.vehicleNo, vehicleNo) ||
                other.vehicleNo == vehicleNo) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverMobileNo, driverMobileNo) ||
                other.driverMobileNo == driverMobileNo) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        exitno,
        exitdate,
        createdtime,
        customerName,
        dcNo,
        sONO,
        poNumber,
        vehicleWithMaterial,
        vehicleWithOutMaterial,
        actualWeight,
        vechileMaterialUrl,
        vechileWithoutMaterialUrl,
        vehicleImageUrl,
        vehicleImage,
        vehicleWeightWithMaterialPhoto,
        vehicleWeightWithOutMaterialPhoto,
        vehicleNo,
        driverName,
        driverMobileNo,
        status
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GateExitFormImplCopyWith<_$GateExitFormImpl> get copyWith =>
      __$$GateExitFormImplCopyWithImpl<_$GateExitFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateExitFormImplToJson(
      this,
    );
  }
}

abstract class _GateExitForm implements GateExitForm {
  factory _GateExitForm(
      {@JsonKey(name: 'name') final String? exitno,
      @JsonKey(name: 'gate_exit_date', toJson: _dateToJson)
      final String? exitdate,
      @JsonKey(name: 'created_time') final String? createdtime,
      @JsonKey(name: 'customer_name') final String? customerName,
      @JsonKey(name: 'dc_no') final String? dcNo,
      @JsonKey(name: 'so_number') final String? sONO,
      @JsonKey(name: 'purchase_order') final String? poNumber,
      @JsonKey(name: 'vehicle_weight_with_material')
      final double? vehicleWithMaterial,
      @JsonKey(name: 'vehicle_weight_without_material')
      final double? vehicleWithOutMaterial,
      @JsonKey(name: 'actual_weight') final double? actualWeight,
      @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
      final String? vechileMaterialUrl,
      @JsonKey(
          name: 'vehicle_weight_without_material_photo', includeToJson: false)
      final String? vechileWithoutMaterialUrl,
      @JsonKey(name: 'vehicle_image', includeToJson: false)
      final String? vehicleImageUrl,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehicleImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehicleWeightWithMaterialPhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehicleWeightWithOutMaterialPhoto,
      @JsonKey(name: 'vehicle_no') final String? vehicleNo,
      @JsonKey(name: 'driver_name') final String? driverName,
      @JsonKey(name: 'driver_mobile_no') final String? driverMobileNo,
      @JsonKey(name: 'status') final String? status}) = _$GateExitFormImpl;

  factory _GateExitForm.fromJson(Map<String, dynamic> json) =
      _$GateExitFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get exitno;
  @override
  @JsonKey(name: 'gate_exit_date', toJson: _dateToJson)
  String? get exitdate;
  @override
  @JsonKey(name: 'created_time')
  String? get createdtime;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'dc_no')
  String? get dcNo;
  @override
  @JsonKey(name: 'so_number')
  String? get sONO;
  @override
  @JsonKey(name: 'purchase_order')
  String? get poNumber;
  @override
  @JsonKey(name: 'vehicle_weight_with_material')
  double? get vehicleWithMaterial;
  @override
  @JsonKey(name: 'vehicle_weight_without_material')
  double? get vehicleWithOutMaterial;
  @override
  @JsonKey(name: 'actual_weight')
  double? get actualWeight;
  @override
  @JsonKey(name: 'vehicle_weight_with_material_photo', includeToJson: false)
  String? get vechileMaterialUrl;
  @override
  @JsonKey(name: 'vehicle_weight_without_material_photo', includeToJson: false)
  String? get vechileWithoutMaterialUrl;
  @override
  @JsonKey(name: 'vehicle_image', includeToJson: false)
  String? get vehicleImageUrl;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleImage;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleWeightWithMaterialPhoto;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleWeightWithOutMaterialPhoto;
  @override
  @JsonKey(name: 'vehicle_no')
  String? get vehicleNo;
  @override
  @JsonKey(name: 'driver_name')
  String? get driverName;
  @override
  @JsonKey(name: 'driver_mobile_no')
  String? get driverMobileNo;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$GateExitFormImplCopyWith<_$GateExitFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
