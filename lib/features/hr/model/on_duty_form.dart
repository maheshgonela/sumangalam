import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_duty_form.freezed.dart';
part 'on_duty_form.g.dart';

@freezed
class OnDutyForm with _$OnDutyForm {
  const factory OnDutyForm({
    @JsonKey(name: 'log_type') String? logType,
    String? time,
    @JsonKey(name: 'custom_customer_details') String? custDetails,
    @JsonKey(name: 'custom_purpose') String? purpose,
    @JsonKey(name: 'custom_remarks') String? remarks,
    @JsonKey(name: 'custom_type') String? dutyType,
    @JsonKey(name: 'device_id') String? location,
    String? selfie,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? selfieFile,
  }) = _OnDutyForm;
  factory OnDutyForm.fromJson(Map<String, dynamic> json) =>
      _$OnDutyFormFromJson(json);
}

dynamic toNull(_) => null;
