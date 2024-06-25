import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:sumangalam/core/model/failure.dart';

typedef AsyncValueOf<T> = Future<Either<Failure,T>>;
typedef HeaderBuilder<T> = Widget Function(
  BuildContext context,
  T selectedItem,
  bool enabled,
);
typedef HeaderListBuilder<T> = Widget Function(
  BuildContext context,
  List<T> selectedItems,
  bool enabled,
);
typedef HintBuilder = Widget Function(
  BuildContext context,
  String hint,
  bool enabled,
);

typedef ListItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  bool isSelected,
  VoidCallback onItemSelect,
);