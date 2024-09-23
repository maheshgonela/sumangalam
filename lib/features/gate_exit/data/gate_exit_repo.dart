import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/utils/utils.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';
import 'package:sumangalam/features/gate_exit/model/delivery_note.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit_filter/gate_exit_filters.dart';

abstract interface class GateExitRepo {
  AsyncValueOf<List<GateExitForm>> fetchGateExits(
    GateExitFilter filters,
    int start,
    int end,
  );

  AsyncValueOf<Pair<String, String>> createGateExit(GateExitForm form);
  AsyncValueOf<String> submitGateExit(GateExitForm form);
  AsyncValueOf<List<DeliveryNote>> fetchPonumberlist();
}
