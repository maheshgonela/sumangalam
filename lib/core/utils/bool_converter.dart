
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/core.dart';

class BoolenAPIConverter implements JsonConverter<bool, int> {
  const BoolenAPIConverter();
  @override
  bool fromJson(Object json) => BooleanUtls.fromInt(json);

  @override
  int toJson(bool object) => BooleanUtls.toInt(object);
}
