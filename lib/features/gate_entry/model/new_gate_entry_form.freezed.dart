// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_gate_entry_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateEntryForm _$GateEntryFormFromJson(Map<String, dynamic> json) {
  return _GateEntryForm.fromJson(json);
}

/// @nodoc
mixin _$GateEntryForm {
  @JsonKey(name: 'name')
  String? get gateEntryNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry_date', toJson: _dateToJson)
  String? get entryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  String? get createdtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_type')
  String? get materialType => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String? get vendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
  ReceiverMode? get receiveMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_no')
  String? get poNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_invoice_no')
  String? get vendorInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
  String? get vendorInvoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String? get remarks => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'document_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get docPhoto => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get docPhotoUrl =>
      throw _privateConstructorUsedError; // "By Hand" fields
  @JsonKey(name: 'delivery_person_name')
  String? get delivererName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_person_mobile')
  String? get delivererMobileNo =>
      throw _privateConstructorUsedError; // "By Vehicle" fields
  @JsonKey(
      name: 'vehicle_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehiclePhoto => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get vehiclePhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_no')
  String? get vehicleNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_mobile_no')
  String? get driverMobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight1')
  double? get weight1 => throw _privateConstructorUsedError; // With Material
  @JsonKey(
      name: 'seal_tag_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get sealPhoto => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get sealPhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'weigth1_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get weight1Photo => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get weight1Url => throw _privateConstructorUsedError; // Vehicle OUT
  @JsonKey(
      name: 'weight2_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get weight2Photo => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get weight2PhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight2')
  double? get weight2 => throw _privateConstructorUsedError; // Without Material
// Add Pile Details
  @JsonKey(
      name: 'unloaded_pile_pic',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get unloadedPilePhoto => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get unloadedPilePhotoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GateEntryFormCopyWith<GateEntryForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateEntryFormCopyWith<$Res> {
  factory $GateEntryFormCopyWith(
          GateEntryForm value, $Res Function(GateEntryForm) then) =
      _$GateEntryFormCopyWithImpl<$Res, GateEntryForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? gateEntryNo,
      @JsonKey(name: 'gate_entry_date', toJson: _dateToJson) String? entryDate,
      @JsonKey(name: 'created_time') String? createdtime,
      @JsonKey(name: 'material_type') String? materialType,
      @JsonKey(name: 'supplier_name') String? vendor,
      @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
      ReceiverMode? receiveMode,
      @JsonKey(name: 'purchase_order_no') String? poNumber,
      @JsonKey(name: 'vendor_invoice_no') String? vendorInvoiceNo,
      @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
      String? vendorInvoiceDate,
      @JsonKey(name: 'remarks') String? remarks,
      String? status,
      @JsonKey(
          name: 'document_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? docPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? docPhotoUrl,
      @JsonKey(name: 'delivery_person_name') String? delivererName,
      @JsonKey(name: 'delivery_person_mobile') String? delivererMobileNo,
      @JsonKey(
          name: 'vehicle_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehiclePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? vehiclePhotoUrl,
      @JsonKey(name: 'vehicle_no') String? vehicleNo,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_mobile_no') String? driverMobileNo,
      @JsonKey(name: 'weight1') double? weight1,
      @JsonKey(
          name: 'seal_tag_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? sealPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? sealPhotoUrl,
      @JsonKey(
          name: 'weigth1_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? weight1Photo,
      @JsonKey(includeFromJson: false, includeToJson: false) String? weight1Url,
      @JsonKey(
          name: 'weight2_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? weight2Photo,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? weight2PhotoUrl,
      @JsonKey(name: 'weight2') double? weight2,
      @JsonKey(
          name: 'unloaded_pile_pic',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? unloadedPilePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? unloadedPilePhotoUrl});
}

/// @nodoc
class _$GateEntryFormCopyWithImpl<$Res, $Val extends GateEntryForm>
    implements $GateEntryFormCopyWith<$Res> {
  _$GateEntryFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateEntryNo = freezed,
    Object? entryDate = freezed,
    Object? createdtime = freezed,
    Object? materialType = freezed,
    Object? vendor = freezed,
    Object? receiveMode = freezed,
    Object? poNumber = freezed,
    Object? vendorInvoiceNo = freezed,
    Object? vendorInvoiceDate = freezed,
    Object? remarks = freezed,
    Object? status = freezed,
    Object? docPhoto = freezed,
    Object? docPhotoUrl = freezed,
    Object? delivererName = freezed,
    Object? delivererMobileNo = freezed,
    Object? vehiclePhoto = freezed,
    Object? vehiclePhotoUrl = freezed,
    Object? vehicleNo = freezed,
    Object? driverName = freezed,
    Object? driverMobileNo = freezed,
    Object? weight1 = freezed,
    Object? sealPhoto = freezed,
    Object? sealPhotoUrl = freezed,
    Object? weight1Photo = freezed,
    Object? weight1Url = freezed,
    Object? weight2Photo = freezed,
    Object? weight2PhotoUrl = freezed,
    Object? weight2 = freezed,
    Object? unloadedPilePhoto = freezed,
    Object? unloadedPilePhotoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      gateEntryNo: freezed == gateEntryNo
          ? _value.gateEntryNo
          : gateEntryNo // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: freezed == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdtime: freezed == createdtime
          ? _value.createdtime
          : createdtime // ignore: cast_nullable_to_non_nullable
              as String?,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
      receiveMode: freezed == receiveMode
          ? _value.receiveMode
          : receiveMode // ignore: cast_nullable_to_non_nullable
              as ReceiverMode?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvoiceNo: freezed == vendorInvoiceNo
          ? _value.vendorInvoiceNo
          : vendorInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvoiceDate: freezed == vendorInvoiceDate
          ? _value.vendorInvoiceDate
          : vendorInvoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      docPhoto: freezed == docPhoto
          ? _value.docPhoto
          : docPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      docPhotoUrl: freezed == docPhotoUrl
          ? _value.docPhotoUrl
          : docPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererName: freezed == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererMobileNo: freezed == delivererMobileNo
          ? _value.delivererMobileNo
          : delivererMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhoto: freezed == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      vehiclePhotoUrl: freezed == vehiclePhotoUrl
          ? _value.vehiclePhotoUrl
          : vehiclePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      weight1: freezed == weight1
          ? _value.weight1
          : weight1 // ignore: cast_nullable_to_non_nullable
              as double?,
      sealPhoto: freezed == sealPhoto
          ? _value.sealPhoto
          : sealPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      sealPhotoUrl: freezed == sealPhotoUrl
          ? _value.sealPhotoUrl
          : sealPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight1Photo: freezed == weight1Photo
          ? _value.weight1Photo
          : weight1Photo // ignore: cast_nullable_to_non_nullable
              as File?,
      weight1Url: freezed == weight1Url
          ? _value.weight1Url
          : weight1Url // ignore: cast_nullable_to_non_nullable
              as String?,
      weight2Photo: freezed == weight2Photo
          ? _value.weight2Photo
          : weight2Photo // ignore: cast_nullable_to_non_nullable
              as File?,
      weight2PhotoUrl: freezed == weight2PhotoUrl
          ? _value.weight2PhotoUrl
          : weight2PhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight2: freezed == weight2
          ? _value.weight2
          : weight2 // ignore: cast_nullable_to_non_nullable
              as double?,
      unloadedPilePhoto: freezed == unloadedPilePhoto
          ? _value.unloadedPilePhoto
          : unloadedPilePhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      unloadedPilePhotoUrl: freezed == unloadedPilePhotoUrl
          ? _value.unloadedPilePhotoUrl
          : unloadedPilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateEntryFormImplCopyWith<$Res>
    implements $GateEntryFormCopyWith<$Res> {
  factory _$$GateEntryFormImplCopyWith(
          _$GateEntryFormImpl value, $Res Function(_$GateEntryFormImpl) then) =
      __$$GateEntryFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? gateEntryNo,
      @JsonKey(name: 'gate_entry_date', toJson: _dateToJson) String? entryDate,
      @JsonKey(name: 'created_time') String? createdtime,
      @JsonKey(name: 'material_type') String? materialType,
      @JsonKey(name: 'supplier_name') String? vendor,
      @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
      ReceiverMode? receiveMode,
      @JsonKey(name: 'purchase_order_no') String? poNumber,
      @JsonKey(name: 'vendor_invoice_no') String? vendorInvoiceNo,
      @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
      String? vendorInvoiceDate,
      @JsonKey(name: 'remarks') String? remarks,
      String? status,
      @JsonKey(
          name: 'document_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? docPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? docPhotoUrl,
      @JsonKey(name: 'delivery_person_name') String? delivererName,
      @JsonKey(name: 'delivery_person_mobile') String? delivererMobileNo,
      @JsonKey(
          name: 'vehicle_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehiclePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? vehiclePhotoUrl,
      @JsonKey(name: 'vehicle_no') String? vehicleNo,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_mobile_no') String? driverMobileNo,
      @JsonKey(name: 'weight1') double? weight1,
      @JsonKey(
          name: 'seal_tag_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? sealPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? sealPhotoUrl,
      @JsonKey(
          name: 'weigth1_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? weight1Photo,
      @JsonKey(includeFromJson: false, includeToJson: false) String? weight1Url,
      @JsonKey(
          name: 'weight2_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? weight2Photo,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? weight2PhotoUrl,
      @JsonKey(name: 'weight2') double? weight2,
      @JsonKey(
          name: 'unloaded_pile_pic',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? unloadedPilePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? unloadedPilePhotoUrl});
}

/// @nodoc
class __$$GateEntryFormImplCopyWithImpl<$Res>
    extends _$GateEntryFormCopyWithImpl<$Res, _$GateEntryFormImpl>
    implements _$$GateEntryFormImplCopyWith<$Res> {
  __$$GateEntryFormImplCopyWithImpl(
      _$GateEntryFormImpl _value, $Res Function(_$GateEntryFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateEntryNo = freezed,
    Object? entryDate = freezed,
    Object? createdtime = freezed,
    Object? materialType = freezed,
    Object? vendor = freezed,
    Object? receiveMode = freezed,
    Object? poNumber = freezed,
    Object? vendorInvoiceNo = freezed,
    Object? vendorInvoiceDate = freezed,
    Object? remarks = freezed,
    Object? status = freezed,
    Object? docPhoto = freezed,
    Object? docPhotoUrl = freezed,
    Object? delivererName = freezed,
    Object? delivererMobileNo = freezed,
    Object? vehiclePhoto = freezed,
    Object? vehiclePhotoUrl = freezed,
    Object? vehicleNo = freezed,
    Object? driverName = freezed,
    Object? driverMobileNo = freezed,
    Object? weight1 = freezed,
    Object? sealPhoto = freezed,
    Object? sealPhotoUrl = freezed,
    Object? weight1Photo = freezed,
    Object? weight1Url = freezed,
    Object? weight2Photo = freezed,
    Object? weight2PhotoUrl = freezed,
    Object? weight2 = freezed,
    Object? unloadedPilePhoto = freezed,
    Object? unloadedPilePhotoUrl = freezed,
  }) {
    return _then(_$GateEntryFormImpl(
      gateEntryNo: freezed == gateEntryNo
          ? _value.gateEntryNo
          : gateEntryNo // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: freezed == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdtime: freezed == createdtime
          ? _value.createdtime
          : createdtime // ignore: cast_nullable_to_non_nullable
              as String?,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
      receiveMode: freezed == receiveMode
          ? _value.receiveMode
          : receiveMode // ignore: cast_nullable_to_non_nullable
              as ReceiverMode?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvoiceNo: freezed == vendorInvoiceNo
          ? _value.vendorInvoiceNo
          : vendorInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvoiceDate: freezed == vendorInvoiceDate
          ? _value.vendorInvoiceDate
          : vendorInvoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      docPhoto: freezed == docPhoto
          ? _value.docPhoto
          : docPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      docPhotoUrl: freezed == docPhotoUrl
          ? _value.docPhotoUrl
          : docPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererName: freezed == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererMobileNo: freezed == delivererMobileNo
          ? _value.delivererMobileNo
          : delivererMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhoto: freezed == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      vehiclePhotoUrl: freezed == vehiclePhotoUrl
          ? _value.vehiclePhotoUrl
          : vehiclePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      weight1: freezed == weight1
          ? _value.weight1
          : weight1 // ignore: cast_nullable_to_non_nullable
              as double?,
      sealPhoto: freezed == sealPhoto
          ? _value.sealPhoto
          : sealPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      sealPhotoUrl: freezed == sealPhotoUrl
          ? _value.sealPhotoUrl
          : sealPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight1Photo: freezed == weight1Photo
          ? _value.weight1Photo
          : weight1Photo // ignore: cast_nullable_to_non_nullable
              as File?,
      weight1Url: freezed == weight1Url
          ? _value.weight1Url
          : weight1Url // ignore: cast_nullable_to_non_nullable
              as String?,
      weight2Photo: freezed == weight2Photo
          ? _value.weight2Photo
          : weight2Photo // ignore: cast_nullable_to_non_nullable
              as File?,
      weight2PhotoUrl: freezed == weight2PhotoUrl
          ? _value.weight2PhotoUrl
          : weight2PhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight2: freezed == weight2
          ? _value.weight2
          : weight2 // ignore: cast_nullable_to_non_nullable
              as double?,
      unloadedPilePhoto: freezed == unloadedPilePhoto
          ? _value.unloadedPilePhoto
          : unloadedPilePhoto // ignore: cast_nullable_to_non_nullable
              as File?,
      unloadedPilePhotoUrl: freezed == unloadedPilePhotoUrl
          ? _value.unloadedPilePhotoUrl
          : unloadedPilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateEntryFormImpl implements _GateEntryForm {
  _$GateEntryFormImpl(
      {@JsonKey(name: 'name') this.gateEntryNo,
      @JsonKey(name: 'gate_entry_date', toJson: _dateToJson) this.entryDate,
      @JsonKey(name: 'created_time') this.createdtime,
      @JsonKey(name: 'material_type') this.materialType,
      @JsonKey(name: 'supplier_name') this.vendor,
      @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
      this.receiveMode,
      @JsonKey(name: 'purchase_order_no') this.poNumber,
      @JsonKey(name: 'vendor_invoice_no') this.vendorInvoiceNo,
      @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
      this.vendorInvoiceDate,
      @JsonKey(name: 'remarks') this.remarks,
      this.status,
      @JsonKey(
          name: 'document_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.docPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false) this.docPhotoUrl,
      @JsonKey(name: 'delivery_person_name') this.delivererName,
      @JsonKey(name: 'delivery_person_mobile') this.delivererMobileNo,
      @JsonKey(
          name: 'vehicle_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehiclePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.vehiclePhotoUrl,
      @JsonKey(name: 'vehicle_no') this.vehicleNo,
      @JsonKey(name: 'driver_name') this.driverName,
      @JsonKey(name: 'driver_mobile_no') this.driverMobileNo,
      @JsonKey(name: 'weight1') this.weight1,
      @JsonKey(
          name: 'seal_tag_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.sealPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false) this.sealPhotoUrl,
      @JsonKey(
          name: 'weigth1_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.weight1Photo,
      @JsonKey(includeFromJson: false, includeToJson: false) this.weight1Url,
      @JsonKey(
          name: 'weight2_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.weight2Photo,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.weight2PhotoUrl,
      @JsonKey(name: 'weight2') this.weight2,
      @JsonKey(
          name: 'unloaded_pile_pic',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.unloadedPilePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.unloadedPilePhotoUrl});

  factory _$GateEntryFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateEntryFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? gateEntryNo;
  @override
  @JsonKey(name: 'gate_entry_date', toJson: _dateToJson)
  final String? entryDate;
  @override
  @JsonKey(name: 'created_time')
  final String? createdtime;
  @override
  @JsonKey(name: 'material_type')
  final String? materialType;
  @override
  @JsonKey(name: 'supplier_name')
  final String? vendor;
  @override
  @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
  final ReceiverMode? receiveMode;
  @override
  @JsonKey(name: 'purchase_order_no')
  final String? poNumber;
  @override
  @JsonKey(name: 'vendor_invoice_no')
  final String? vendorInvoiceNo;
  @override
  @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
  final String? vendorInvoiceDate;
  @override
  @JsonKey(name: 'remarks')
  final String? remarks;
  @override
  final String? status;
  @override
  @JsonKey(
      name: 'document_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? docPhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? docPhotoUrl;
// "By Hand" fields
  @override
  @JsonKey(name: 'delivery_person_name')
  final String? delivererName;
  @override
  @JsonKey(name: 'delivery_person_mobile')
  final String? delivererMobileNo;
// "By Vehicle" fields
  @override
  @JsonKey(
      name: 'vehicle_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehiclePhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? vehiclePhotoUrl;
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
  @JsonKey(name: 'weight1')
  final double? weight1;
// With Material
  @override
  @JsonKey(
      name: 'seal_tag_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? sealPhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? sealPhotoUrl;
  @override
  @JsonKey(
      name: 'weigth1_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? weight1Photo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? weight1Url;
// Vehicle OUT
  @override
  @JsonKey(
      name: 'weight2_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? weight2Photo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? weight2PhotoUrl;
  @override
  @JsonKey(name: 'weight2')
  final double? weight2;
// Without Material
// Add Pile Details
  @override
  @JsonKey(
      name: 'unloaded_pile_pic',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? unloadedPilePhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? unloadedPilePhotoUrl;

  @override
  String toString() {
    return 'GateEntryForm(gateEntryNo: $gateEntryNo, entryDate: $entryDate, createdtime: $createdtime, materialType: $materialType, vendor: $vendor, receiveMode: $receiveMode, poNumber: $poNumber, vendorInvoiceNo: $vendorInvoiceNo, vendorInvoiceDate: $vendorInvoiceDate, remarks: $remarks, status: $status, docPhoto: $docPhoto, docPhotoUrl: $docPhotoUrl, delivererName: $delivererName, delivererMobileNo: $delivererMobileNo, vehiclePhoto: $vehiclePhoto, vehiclePhotoUrl: $vehiclePhotoUrl, vehicleNo: $vehicleNo, driverName: $driverName, driverMobileNo: $driverMobileNo, weight1: $weight1, sealPhoto: $sealPhoto, sealPhotoUrl: $sealPhotoUrl, weight1Photo: $weight1Photo, weight1Url: $weight1Url, weight2Photo: $weight2Photo, weight2PhotoUrl: $weight2PhotoUrl, weight2: $weight2, unloadedPilePhoto: $unloadedPilePhoto, unloadedPilePhotoUrl: $unloadedPilePhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateEntryFormImpl &&
            (identical(other.gateEntryNo, gateEntryNo) ||
                other.gateEntryNo == gateEntryNo) &&
            (identical(other.entryDate, entryDate) ||
                other.entryDate == entryDate) &&
            (identical(other.createdtime, createdtime) ||
                other.createdtime == createdtime) &&
            (identical(other.materialType, materialType) ||
                other.materialType == materialType) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.receiveMode, receiveMode) ||
                other.receiveMode == receiveMode) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.vendorInvoiceNo, vendorInvoiceNo) ||
                other.vendorInvoiceNo == vendorInvoiceNo) &&
            (identical(other.vendorInvoiceDate, vendorInvoiceDate) ||
                other.vendorInvoiceDate == vendorInvoiceDate) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.docPhoto, docPhoto) ||
                other.docPhoto == docPhoto) &&
            (identical(other.docPhotoUrl, docPhotoUrl) ||
                other.docPhotoUrl == docPhotoUrl) &&
            (identical(other.delivererName, delivererName) ||
                other.delivererName == delivererName) &&
            (identical(other.delivererMobileNo, delivererMobileNo) ||
                other.delivererMobileNo == delivererMobileNo) &&
            (identical(other.vehiclePhoto, vehiclePhoto) ||
                other.vehiclePhoto == vehiclePhoto) &&
            (identical(other.vehiclePhotoUrl, vehiclePhotoUrl) ||
                other.vehiclePhotoUrl == vehiclePhotoUrl) &&
            (identical(other.vehicleNo, vehicleNo) ||
                other.vehicleNo == vehicleNo) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverMobileNo, driverMobileNo) ||
                other.driverMobileNo == driverMobileNo) &&
            (identical(other.weight1, weight1) || other.weight1 == weight1) &&
            (identical(other.sealPhoto, sealPhoto) ||
                other.sealPhoto == sealPhoto) &&
            (identical(other.sealPhotoUrl, sealPhotoUrl) ||
                other.sealPhotoUrl == sealPhotoUrl) &&
            (identical(other.weight1Photo, weight1Photo) ||
                other.weight1Photo == weight1Photo) &&
            (identical(other.weight1Url, weight1Url) ||
                other.weight1Url == weight1Url) &&
            (identical(other.weight2Photo, weight2Photo) ||
                other.weight2Photo == weight2Photo) &&
            (identical(other.weight2PhotoUrl, weight2PhotoUrl) ||
                other.weight2PhotoUrl == weight2PhotoUrl) &&
            (identical(other.weight2, weight2) || other.weight2 == weight2) &&
            (identical(other.unloadedPilePhoto, unloadedPilePhoto) ||
                other.unloadedPilePhoto == unloadedPilePhoto) &&
            (identical(other.unloadedPilePhotoUrl, unloadedPilePhotoUrl) ||
                other.unloadedPilePhotoUrl == unloadedPilePhotoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        gateEntryNo,
        entryDate,
        createdtime,
        materialType,
        vendor,
        receiveMode,
        poNumber,
        vendorInvoiceNo,
        vendorInvoiceDate,
        remarks,
        status,
        docPhoto,
        docPhotoUrl,
        delivererName,
        delivererMobileNo,
        vehiclePhoto,
        vehiclePhotoUrl,
        vehicleNo,
        driverName,
        driverMobileNo,
        weight1,
        sealPhoto,
        sealPhotoUrl,
        weight1Photo,
        weight1Url,
        weight2Photo,
        weight2PhotoUrl,
        weight2,
        unloadedPilePhoto,
        unloadedPilePhotoUrl
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      __$$GateEntryFormImplCopyWithImpl<_$GateEntryFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateEntryFormImplToJson(
      this,
    );
  }
}

abstract class _GateEntryForm implements GateEntryForm {
  factory _GateEntryForm(
      {@JsonKey(name: 'name') final String? gateEntryNo,
      @JsonKey(name: 'gate_entry_date', toJson: _dateToJson)
      final String? entryDate,
      @JsonKey(name: 'created_time') final String? createdtime,
      @JsonKey(name: 'material_type') final String? materialType,
      @JsonKey(name: 'supplier_name') final String? vendor,
      @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
      final ReceiverMode? receiveMode,
      @JsonKey(name: 'purchase_order_no') final String? poNumber,
      @JsonKey(name: 'vendor_invoice_no') final String? vendorInvoiceNo,
      @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
      final String? vendorInvoiceDate,
      @JsonKey(name: 'remarks') final String? remarks,
      final String? status,
      @JsonKey(
          name: 'document_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? docPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? docPhotoUrl,
      @JsonKey(name: 'delivery_person_name') final String? delivererName,
      @JsonKey(name: 'delivery_person_mobile') final String? delivererMobileNo,
      @JsonKey(
          name: 'vehicle_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehiclePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? vehiclePhotoUrl,
      @JsonKey(name: 'vehicle_no') final String? vehicleNo,
      @JsonKey(name: 'driver_name') final String? driverName,
      @JsonKey(name: 'driver_mobile_no') final String? driverMobileNo,
      @JsonKey(name: 'weight1') final double? weight1,
      @JsonKey(
          name: 'seal_tag_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? sealPhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? sealPhotoUrl,
      @JsonKey(
          name: 'weigth1_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? weight1Photo,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? weight1Url,
      @JsonKey(
          name: 'weight2_image',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? weight2Photo,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? weight2PhotoUrl,
      @JsonKey(name: 'weight2') final double? weight2,
      @JsonKey(
          name: 'unloaded_pile_pic',
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? unloadedPilePhoto,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? unloadedPilePhotoUrl}) = _$GateEntryFormImpl;

  factory _GateEntryForm.fromJson(Map<String, dynamic> json) =
      _$GateEntryFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get gateEntryNo;
  @override
  @JsonKey(name: 'gate_entry_date', toJson: _dateToJson)
  String? get entryDate;
  @override
  @JsonKey(name: 'created_time')
  String? get createdtime;
  @override
  @JsonKey(name: 'material_type')
  String? get materialType;
  @override
  @JsonKey(name: 'supplier_name')
  String? get vendor;
  @override
  @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson)
  ReceiverMode? get receiveMode;
  @override
  @JsonKey(name: 'purchase_order_no')
  String? get poNumber;
  @override
  @JsonKey(name: 'vendor_invoice_no')
  String? get vendorInvoiceNo;
  @override
  @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson)
  String? get vendorInvoiceDate;
  @override
  @JsonKey(name: 'remarks')
  String? get remarks;
  @override
  String? get status;
  @override
  @JsonKey(
      name: 'document_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get docPhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get docPhotoUrl;
  @override // "By Hand" fields
  @JsonKey(name: 'delivery_person_name')
  String? get delivererName;
  @override
  @JsonKey(name: 'delivery_person_mobile')
  String? get delivererMobileNo;
  @override // "By Vehicle" fields
  @JsonKey(
      name: 'vehicle_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehiclePhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get vehiclePhotoUrl;
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
  @JsonKey(name: 'weight1')
  double? get weight1;
  @override // With Material
  @JsonKey(
      name: 'seal_tag_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get sealPhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get sealPhotoUrl;
  @override
  @JsonKey(
      name: 'weigth1_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get weight1Photo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get weight1Url;
  @override // Vehicle OUT
  @JsonKey(
      name: 'weight2_image',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get weight2Photo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get weight2PhotoUrl;
  @override
  @JsonKey(name: 'weight2')
  double? get weight2;
  @override // Without Material
// Add Pile Details
  @JsonKey(
      name: 'unloaded_pile_pic',
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get unloadedPilePhoto;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get unloadedPilePhotoUrl;
  @override
  @JsonKey(ignore: true)
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
