import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as dev;
import 'package:sumangalam/core/di/injector.dart';

final $logger = $sl.get<AppLogger>(instanceName: 'app_logger');

@Named("app_logger")
@injectable
class AppLogger {
  final _$logger = Logger(
    printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.dateAndTime, colors: true,printEmojis: true),
    level: Level.all,
  );

  void info(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _$logger.i(message,
        error: error, stackTrace: stackTrace, time: DateTime.now());
  }

  void error(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _$logger.e(message,
        error: error, stackTrace: stackTrace, time: DateTime.now());
  }

  void devLog(dynamic message) {
    dev.log(message.toString());
  }
}
