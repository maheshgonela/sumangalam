import 'package:sumangalam/core/model/pair_triple.dart.dart';
import 'package:sumangalam/core/utils/typedefs.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/model/po_order.dart';


abstract interface class GateEntryRepo {
  AsyncValueOf<List<GateEntryForm>> fetchGateEntries(String? status, int start, int end);
  AsyncValueOf<List<POOrder>> fetchPurchaseOrders(String query);

  AsyncValueOf<Pair<String, String>> createGateEntry(GateEntryForm form);
  AsyncValueOf<String> updatePileDetails(GateEntryForm form);
  AsyncValueOf<String> submitGateEntry(GateEntryForm form);

  AsyncValueOf<GateEntryAttachments> fetchAttachments(String gateEntryNo);
}