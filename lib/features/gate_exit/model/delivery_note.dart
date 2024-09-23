import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';

part 'delivery_note.freezed.dart';
part 'delivery_note.g.dart';

@freezed
class DeliveryNote with _$DeliveryNote {
  const factory DeliveryNote({
    required String name,
    @JsonKey(name: 'custom_sales_order') String? soNo,
    @JsonKey(name: 'custom_purchase_order') String? poNumber,
    @JsonKey(name: 'customer_name') required String customerName,
  }) = _DeliveryNote;

  factory DeliveryNote.fromJson(Map<String, dynamic> json) =>
      _$DeliveryNoteFromJson(json);

  static DeliveryNote? fromEntry(GateExitForm form) {
    if (form.dcNo.isNull) return null;
    return DeliveryNote(
      name: form.dcNo.valueOrEmpty,
      soNo: form.sONO.valueOrEmpty,
      poNumber: form.poNumber.valueOrEmpty,
      customerName: form.customerName.valueOrEmpty,
    );
  }
}
