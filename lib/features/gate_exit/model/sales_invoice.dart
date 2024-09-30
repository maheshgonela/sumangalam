import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice.freezed.dart';
part 'sales_invoice.g.dart';

@freezed
class SalesInvoice with _$SalesInvoice {
  const factory SalesInvoice({
    @Default('') String name,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'custom_purchase_order') String? purchaseOrder,
    @JsonKey(name: 'custom_sales_order') String? salesOrder,
  }) = _SalesInvoice;
factory SalesInvoice.fromJson(Map<String, dynamic> json) => _$SalesInvoiceFromJson(json);
}