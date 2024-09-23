import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/utils/typedefs.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/model/po_order.dart';
import 'package:sumangalam/features/gate_entry/model/supplier.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry_filter/gate_entry_filters.dart';


abstract interface class GateEntryRepo {
  AsyncValueOf<List<GateEntryForm>> fetchGateEntries(GateEntryFilter filters, int start, int end);
  AsyncValueOf<List<Supplier>> getSuppliers(String name);
  AsyncValueOf<List<POOrder>> fetchPurchaseOrders(String supplier);

  AsyncValueOf<Pair<String, String>> createGateEntry(GateEntryForm form);
  AsyncValueOf<String> updatePileDetails(GateEntryForm form);
  AsyncValueOf<String> submitGateEntry(GateEntryForm form);

  AsyncValueOf<GateEntryAttachments> fetchAttachments(String gateEntryNo);
}
