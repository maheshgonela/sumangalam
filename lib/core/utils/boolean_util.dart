abstract class BooleanUtls {
  static bool fromInt(dynamic value) {
    if(value == null) return false;
    if(value == 0) {
      return false;
    } else if(value == 1) {
      return true;
    }
    throw ArgumentError.value(value);
  }

  static int toInt(bool value) {
    return value ? 1 : 0;
  }
}