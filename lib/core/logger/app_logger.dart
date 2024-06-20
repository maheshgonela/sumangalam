import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sumangalam/core/di/injector.dart';

final $logger = $sl.get<AppLogger>(instanceName: 'app_logger');

@Named("app_logger")
@injectable
class AppLogger {
  final _$logger = Logger(
    printer: PrettyPrinter(printTime: true,colors: true,printEmojis: true),
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

  void print(dynamic message, [dynamic v1, dynamic v2]) {

  }
}
