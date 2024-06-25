import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';

part 'po_order.freezed.dart';
part 'po_order.g.dart';

@freezed
class POOrder with _$POOrder {
  const factory POOrder({
    required String name,
    @JsonKey(name: 'supplier_name', defaultValue: '') required String supplier,
    @JsonKey(name: 'transaction_date') String? trxnDate,
    String? status,
    @JsonKey(name: 'grand_total', defaultValue: 0.0) required double total,
  }) = _POOrder;

  factory POOrder.fromJson(Map<String, dynamic> json) =>
      _$POOrderFromJson(json);
  
  static POOrder? fromName(String? name) {
    if(name.doesNotHaveValue) return null;
    return POOrder(name: name!, supplier: '', total: 0.0);
  }
}