import 'package:dartz/dartz.dart';
import 'package:sumangalam/core/model/failure.dart';

extension StringExentions on String? {
  // Either<Failure, T> asFailure<T>() => left(Failure(error: this!));

  bool get containsValidValue =>
      this != null && (this!.trim().isNotEmpty) && this!.trim() != 'null';

  bool get doesNotHaveValue => !containsValidValue;

  String get valueOrEmpty => this ?? '';

  Either<Failure, T> asFailure<T>() => left(Failure(error: this!));

  String capitalize() {
    if (doesNotHaveValue) return valueOrEmpty;
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  bool get isBase64 => StringHelper.base64.hasMatch(valueOrEmpty);
}

class StringHelper {
  static RegExp base64 = RegExp(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');
}
