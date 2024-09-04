import 'package:equatable/equatable.dart';
import 'package:sumangalam/core/core.dart';

class GateExitFilterCubit extends AppBaseCubit<GateExitFilter> {
  GateExitFilterCubit() : super(GateExitFilter.initial());

  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }

  void onSearch(String? query) {
    if(query.doesNotHaveValue) {
      emitSafeState(GateExitFilter(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}


class GateExitFilter extends Equatable {
  const GateExitFilter({required this.status, this.query});

  final String status;
  final String? query;
  
  @override
  List<Object?> get props => [status, query];

  factory GateExitFilter.initial() => const GateExitFilter(status: 'Draft');

  GateExitFilter copyWith({
    String? status,
    String? query,
  }) => GateExitFilter(status: status ?? this.status, query: query ?? this.query);
}