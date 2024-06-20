import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/features/gateEntry/model/receiver_mode.dart';
part 'new_gate_entry_form.freezed.dart';
part 'new_gate_entry_form.g.dart';

@freezed
class GateEntryForm with _$GateEntryForm {
  const factory GateEntryForm({
    String? creationDate,
    String? materialType,
    String? vendorName,
    ReceiverMode? receiveMode,
    String? poNumber,
    String? vendorInvoiceNo,
    String? vendorInvoiceDate,
    String? remarks,
    String? docPhoto,

    // "By Hand" fields
    String? delivererName,
    String? delivererMobileNo,

    // "By Vehicle" fields
    String? vehiclePhoto,
    String? vehicleNo,
    String? driverName,
    String? driverMobileNo,
    String? sealPhoto,
    String? weightPhoto,
  }) = _GateEntryForm;

  factory GateEntryForm.fromJson(Map<String, dynamic> json) =>
      _$GateEntryFormFromJson(json);
}
