import 'package:sumangalam/core/utils/typedefs.dart';
import 'package:sumangalam/features/gateEntry/model/new_gate_entry_form.dart';


abstract interface class GateEntryRepo {

  AsyncValueOf<String> createGateEntry(GateEntryForm form);
  AsyncValueOf<String> submitGateEntry(GateEntryForm form);
}
