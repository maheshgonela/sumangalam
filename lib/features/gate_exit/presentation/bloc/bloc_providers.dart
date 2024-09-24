import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit_filter/gate_exit_filters.dart';
import 'package:sumangalam/features/gate_exit/data/gate_exit_repo.dart';

typedef GateExitsCubit = InfiniteListCubit<GateExitForm, GateExitFilter, GateExitFilter>;
typedef GateExitsState = InfiniteListState<GateExitForm>;

@injectable
class GateExitBlocProvider {
  const GateExitBlocProvider({required this.repo});

  final GateExitRepo repo;

  static GateExitBlocProvider instance() => $sl.get<GateExitBlocProvider>();

  GateExitsCubit gateExits() => GateExitsCubit(
    requestInitial: (params, state) => repo.fetchGateExits(params!, 0, 20),
    requestMore: (params, state) => repo.fetchGateExits(params!, state.curLength , state.curLength + 20),
  );


  

  
}