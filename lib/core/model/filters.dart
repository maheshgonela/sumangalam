import 'package:freezed_annotation/freezed_annotation.dart';
part 'filters.freezed.dart';
part 'filters.g.dart';

/// Represents a [ADPreference](http://wiki.openbravo.com/wiki/Preference) in openbravo.
///
/// We are only interested in value of the preference, hence only single field in the model class.
@freezed
class Filters with _$Filters {
  factory Filters({
    required String id,
    @JsonKey(name: 'glitem\$_identifier') required String name,
  }) = _Filters;

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);
}
