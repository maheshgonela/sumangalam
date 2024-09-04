import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';

part 'shipment.freezed.dart';
part 'shipment.g.dart';

@freezed
class Shipment with _$Shipment {
  const factory Shipment({
    @JsonKey(name: 'name') required String shipmentNo,
    @JsonKey(name: 'custom_dc_no') required String dcNo,
    @JsonKey(name: 'custom_so_number') required String soNo,
    @JsonKey(name: 'custom_po_number') required String poNumber,
    @JsonKey(name: 'custom_customer_name') required String customerName,
  }) = _Shipment;

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  static Shipment? fromEntry(GateExitForm form) {
    if (form.dcNo.isNull) return null;
    return Shipment(
      shipmentNo: form.dcNo.valueOrEmpty,
      dcNo: form.dcNo.valueOrEmpty,
      soNo: form.sONO.valueOrEmpty,
      poNumber: form.poNumber.valueOrEmpty,
      customerName: form.customerName.valueOrEmpty,
    );
  }
}
