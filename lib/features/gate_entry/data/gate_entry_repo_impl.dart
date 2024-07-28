import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/model/pair_triple.dart.dart';
import 'package:sumangalam/core/network/network.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/model/po_order.dart';
import 'package:sumangalam/features/gate_entry/model/supplier.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry_filter/gate_entry_filters.dart';

@LazySingleton(as: GateEntryRepo)
class GateEntryRepoImpl extends BaseApiRepository implements GateEntryRepo {
  const GateEntryRepoImpl(super.client);
  @override
  AsyncValueOf<List<GateEntryForm>> fetchGateEntries(GateEntryFilter filter, int start, int end) async {
    try {
      final config = RequestConfig(
        url: Urls.gateEntries, 
        body: jsonEncode({
          'status' : filter.status, 
          'start' : start, 
          'end' : end,
          if(filter.query.containsValidValue)
            'query' : filter.query,
        }),
        parser: (p0) {
          final entries = p0['message']['data'] as List<dynamic>;
          return entries.map((e) => GateEntryForm.fromJson(e)).toList();
        },
      );
      final response = await post(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[GateEntryForm]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<List<Supplier>> getSuppliers(String query) async {
    try {
      final config = RequestConfig(
        url: Urls.supplierList, 
        body: jsonEncode({'supplier_name' : query}),
        parser: (p0) {
          final orders = p0['message']['data'] as List<dynamic>;
          return orders.map((e) => Supplier.fromJson(e)).toList();
        },
      );

      final response = await post(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[Supplier]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<List<POOrder>> fetchPurchaseOrders(String supplier) async {
    try {
      final config = RequestConfig(
        url: Urls.purchaseOrders, 
        body: jsonEncode({'supplier_name' : supplier}),
        parser: (p0) {
          final orders = p0['message']['data'] as List<dynamic>;
          return orders.map((e) => POOrder.fromJson(e)).toList();
        },
      );
      final response = await post(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[POOrder]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<Pair<String, String>> createGateEntry(GateEntryForm form) async {
    try {  
      final formJson = GateEntryForm.toEncodedFormJson(form);
      formJson.update('status', (value) => 'Draft');
      final cleanedMap = removeNullValues(formJson);
      final config = RequestConfig(
        url: Urls.createGateEntry, 
        reqParams: cleanedMap,
        parser: (p0) => p0['message']['gate_entry_no'] as String,
      );
      final response = await multiPart(config);
      return response.process((r) {
        final docNo = r.data.valueOrEmpty; 
        const successMsg = 'The Gate Entry Details have been saved successfully. Please add pile details.';
        return right(Pair(docNo, successMsg));
      });
    } on Exception catch (e, st) {
      $logger.error('[Gate Entry Creation]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<String> updatePileDetails(GateEntryForm form) async {
    try {  
      final formJson = GateEntryForm.toEncodedFormJson(form);
      $logger.devLog(formJson);
      formJson.update('status', (value) => 'Update');
      formJson.removeWhere((key, value) => key == 'name');
      final cleanedMap = removeNullValues(formJson);
      $logger.devLog(cleanedMap);
      final config = RequestConfig(
        url: Urls.createGateEntry, 
        reqParams: cleanedMap,
        parser: (p0) => p0,
      );
      final response = await multiPart(config);
      return response.process((r) {
        const successMsg ='The Gate Entry Details have been updated successfully. Please add vechile weight details.';
        return right(successMsg);
      });
    } on Exception catch (e, st) {
      $logger.error('[Gate Entry Updation]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<String> submitGateEntry(GateEntryForm form) async {
    try {  
      final formJson = GateEntryForm.toEncodedFormJson(form);
      formJson.update('status', (value) => 'Submit');
      final cleanedMap = removeNullValues(formJson);
      final config = RequestConfig(
        url: Urls.createGateEntry, 
        reqParams: cleanedMap,
        parser: (p0) => p0,
      );
      final response = await multiPart(config);
      return response.process((r) {
        const successMsg ='The Gate Entry Details have been submitted successfully.';
        return right(successMsg);
      });
    } on Exception catch (e, st) {
      $logger.error('[Gate Entry Submit]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<GateEntryAttachments> fetchAttachments(String gateEntryNo) async {
    try {  
      final config = RequestConfig(
        url: Urls.gateEntryAttachments,
        body: jsonEncode({'gate_entry_no' : gateEntryNo}),
        parser: (p0) => GateEntryAttachments.fromJson(p0['message']['data']['attachments']),
      );
      final response = await post(config);
      return response.processAsync((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[Gate Entry Attachments]', e, st);
      return left(Failure(error: e.toString()));
    }
  }
}