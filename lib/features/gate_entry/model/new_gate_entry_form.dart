import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';
import 'package:sumangalam/features/gate_entry/model/receiver_mode.dart';
part 'new_gate_entry_form.freezed.dart';
part 'new_gate_entry_form.g.dart';

@freezed
class GateEntryForm with _$GateEntryForm {
  factory GateEntryForm({
    @JsonKey(name: 'name') String? gateEntryNo,
    @JsonKey(name: 'gate_entry_date', toJson: _dateToJson) String? entryDate,
    @JsonKey(name: 'created_time') String? createdtime,
    @JsonKey(name: 'material_type') String? materialType,
    @JsonKey(name: 'supplier_name') String? vendor,
    @JsonKey(name: 'receiver_mode', fromJson: _receiveModeFromJson) ReceiverMode? receiveMode,
    @JsonKey(name: 'purchase_order_no') String? poNumber,
    @JsonKey(name: 'vendor_invoice_no') String? vendorInvoiceNo,
    @BoolenAPIConverter() @JsonKey(name: 'po_available') bool? isPOAvailable,
    @JsonKey(name: 'vendor_invoice_date', toJson: _dateToJson) String? vendorInvoiceDate,
    @JsonKey(name: 'remarks') String? remarks,
    String? status,
    @JsonKey(name: 'document_image', includeFromJson: true, includeToJson: false, toJson: toNull, fromJson: toNull) File? docPhoto,
    @JsonKey(includeFromJson: false, includeToJson: false) String? docPhotoUrl,

    // "By Hand" fields
    @JsonKey(name: 'delivery_person_name') String? delivererName,
    @JsonKey(name: 'delivery_person_mobile') String? delivererMobileNo,

    // "By Vehicle" fields
    @JsonKey(name: 'vehicle_image', includeFromJson: true, includeToJson: false, toJson: toNull, fromJson: toNull) File? vehiclePhoto,
    @JsonKey(includeFromJson: false, includeToJson: false) String? vehiclePhotoUrl,
    @JsonKey(name: 'vehicle_no') String? vehicleNo,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_mobile_no') String? driverMobileNo,
    @JsonKey(name: 'weight1') double? weight1, // With Material
    @JsonKey(name: 'bill_weight') String? documentWeight,
    @JsonKey(name: 'seal_tag_image', includeFromJson: true, includeToJson: false, toJson: toNull, fromJson: toNull) File? sealPhoto,
    @JsonKey(includeFromJson: false, includeToJson: false) String? sealPhotoUrl,
    @JsonKey(name: 'weigth1_image', includeFromJson: true, includeToJson: false, toJson: toNull, fromJson: toNull) File? weight1Photo,
    @JsonKey(includeFromJson: false, includeToJson: false) String? weight1Url,

    // Vehicle OUT
    @JsonKey(name: 'weight2_image', includeFromJson: true, includeToJson: false, toJson: toNull, fromJson: toNull) File? weight2Photo,
    @JsonKey(includeFromJson: false, includeToJson: false) String? weight2PhotoUrl,
    @JsonKey(name: 'weight2') double? weight2, // Without Material
    @JsonKey(name: 'actual_weight') double? actualWeight, // With Material

    // Add Pile Details
    @JsonKey(name: 'unloaded_pile_pic', includeFromJson: true, includeToJson: false, toJson: toNull, fromJson: toNull) File? unloadedPilePhoto,
    @JsonKey(includeFromJson: false, includeToJson: false) String? unloadedPilePhotoUrl,
  }) = _GateEntryForm;

  factory GateEntryForm.fromJson(Map<String, dynamic> json) =>
      _$GateEntryFormFromJson(json);


  static Map<String, dynamic> toEncodedFormJson(final GateEntryForm form) {
    final json = form.toJson();
    json['gate_entry_no'] = form.gateEntryNo;
    if (form.receiveMode == ReceiverMode.byHand) {
      json
        ..remove('vehicle_image')
        ..remove('vehicle_no')
        ..remove('driver_name')
        ..remove('seal_tag_image')
        ..remove('driver_mobile_no');
    }
    if (form.receiveMode == ReceiverMode.byVehicle) {
      json
        ..remove('delivery_person_name')
        ..remove('delivery_person_mobile') 
        ..addAll({
          'vehicle_image' : form.vehiclePhoto,
          'seal_tag_image' : form.sealPhoto,
        });
    }

    json['receive_mode'] = form.receiveMode?.name;
    json['document_image'] = form.docPhoto;
    json['unloaded_pile_pic'] = form.unloadedPilePhoto;

    return json;
  }
}

ReceiverMode? _receiveModeFromJson(String? receiveMode) => ReceiverMode.fromName(receiveMode);
String? _dateToJson(String? date) {
  if(date.isNull) return null;
  final dateTime = DFU.toDateTime(date!, 'dd-MM-yyyy');
  return DFU.yyyyMMdd(dateTime);
}

extension GateEntryFormApi on GateEntryForm {
  bool get isNotSaved => status.doesNotHaveValue;
  bool get isDraft => status == 'Draft';
  bool get isSubmitted => status == 'Submit';
}

dynamic toNull(_) => null;
