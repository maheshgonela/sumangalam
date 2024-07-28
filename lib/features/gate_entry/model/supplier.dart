import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';

part 'supplier.freezed.dart';
part 'supplier.g.dart';

@freezed
class Supplier with _$Supplier {
  const factory Supplier({
    @JsonKey(name: 'supplier_name', defaultValue: '') required String supplier,
    @JsonKey(name: 'address_line1') String? addLine1,
    @JsonKey(name: 'address_line2') String? addLine2,
    String? phone,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);
  
  static Supplier? fromName(String? name) {
    if(name.doesNotHaveValue) return null;
    return Supplier(supplier: name!);
  }
}