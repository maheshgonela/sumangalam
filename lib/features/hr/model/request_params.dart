import 'package:equatable/equatable.dart';

class RequestParams extends Equatable {
  final String status;
  final DateTime start;
  final DateTime end;

  const RequestParams({required this.status, required this.start, required this.end});
  
  @override
  List<Object?> get props => [status,start,end];
}
