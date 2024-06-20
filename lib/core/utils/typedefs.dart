import 'package:dartz/dartz.dart';
import 'package:sumangalam/core/model/failure.dart';

typedef AsyncValueOf<T> = Future<Either<Failure,T>>;
