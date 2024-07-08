import 'package:equatable/equatable.dart';
import 'package:sumangalam/core/core.dart';

class GateEntryFilterCubit extends AppBaseCubit<GateEntryFilter> {
  GateEntryFilterCubit() : super(GateEntryFilter.initial());

  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }

  void onSearch(String? query) {
    if(query.doesNotHaveValue) {
      emitSafeState(GateEntryFilter(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}


class GateEntryFilter extends Equatable {
  const GateEntryFilter({required this.status, this.query});

  final String status;
  final String? query;
  
  @override
  List<Object?> get props => [status, query];

  factory GateEntryFilter.initial() => const GateEntryFilter(status: 'Draft');

  GateEntryFilter copyWith({
    String? status,
    String? query,
  }) => GateEntryFilter(status: status ?? this.status, query: query ?? this.query);
}