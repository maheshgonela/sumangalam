import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_preference.freezed.dart';
part 'app_preference.g.dart';

/// Represents a [ADPreference](http://wiki.openbravo.com/wiki/Preference) in openbravo.
///
/// We are only interested in value of the preference, hence only single field in the model class.
@freezed
class AppPreference with _$AppPreference {
  factory AppPreference({
    /// value of the preference
    @JsonKey(name: 'searchKey', defaultValue: '') required String searchKey,
  }) = _AppPreference;

  factory AppPreference.fromJson(Map<String, dynamic> json) =>
      _$AppPreferenceFromJson(json);
}
