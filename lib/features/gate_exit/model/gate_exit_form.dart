import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';

part 'gate_exit_form.freezed.dart';
part 'gate_exit_form.g.dart';

@freezed
class GateExitForm with _$GateExitForm {
  factory GateExitForm({
    @JsonKey(name: 'name') String? exitno,
    @JsonKey(name: 'gate_exit_date', toJson: _dateToJson) String? exitdate,
    @JsonKey(name: 'created_time') String? createdtime,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'dc_no') String? dcNo,
    @JsonKey(name: 'so_number') String? sONO,
    @JsonKey(name: 'purchase_order') String? poNumber,
    @JsonKey(name: 'vehicle_weight_with_material') double? vehicleWithMaterial,
    @JsonKey(name: 'vehicle_weight_without_material') double? vehicleWithOutMaterial,
    @JsonKey(name: 'actual_weight') double? actualWeight,
    @JsonKey(name: 'vehicle_weight_with_material_photo',includeToJson: false) String? vechileMaterialUrl,
    @JsonKey(name: 'vehicle_weight_without_material_photo',includeToJson:false ) String? vechileWithoutMaterialUrl,
    @JsonKey(name: 'vehicle_image', includeToJson: false) String? vehicleImageUrl,
    @JsonKey(includeFromJson: true,includeToJson: false,toJson: toNull,fromJson: toNull)File? vehicleImage,
    @JsonKey(includeFromJson: true,includeToJson: false,toJson: toNull,fromJson: toNull)File? vehicleWeightWithMaterialPhoto,
    @JsonKey(includeFromJson: true,includeToJson: false,toJson: toNull,fromJson: toNull)File? vehicleWeightWithOutMaterialPhoto,
    @JsonKey(name: 'vehicle_no') String? vehicleNo,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_mobile_no') String? driverMobileNo,
    @JsonKey(name: 'status') String? status,
  }) = _GateExitForm;

  factory GateExitForm.fromJson(Map<String, dynamic> json) =>
      _$GateExitFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final GateExitForm form) {
    final json = form.toJson();
    if (form.exitno.isNotNull) {
      json['gate_exit_no'] = form.exitno;
    }
    json['vehicle_image'] = form.vehicleImage;
    json['vehicle_weight_with_material_photo'] = form.vehicleWeightWithMaterialPhoto;
    json['vehicle_weight_without_material_photo'] = form.vehicleWeightWithOutMaterialPhoto;
    return json;
  }
}

extension GateExitFormApi on GateExitForm {
  bool get isNotSaved => status.doesNotHaveValue;
  bool get isSubmitted => status == 'Submit';
}

String? _dateToJson(String? date) {
  if (date.isNull) return null;
  final dateTime = DFU.toDateTime(date!, 'dd-MM-yyyy');
  return DFU.yyyyMMdd(dateTime);
}

dynamic toNull(_) => null;
