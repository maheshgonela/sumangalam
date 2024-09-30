import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/network/network.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';
import 'package:sumangalam/features/gate_exit/model/sales_invoice.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit_filter/gate_exit_filters.dart';
import 'package:sumangalam/features/gate_exit/data/gate_exit_repo.dart';

@Singleton(as: GateExitRepo)
class GateExitRepoImpl extends BaseApiRepository implements GateExitRepo {
  const GateExitRepoImpl(super.client);

  @override
  AsyncValueOf<List<GateExitForm>> fetchGateExits(
      GateExitFilter filter, int start, int end) async {
    try {
      final filters = [
        if (filter.status != 'All') ...[
          ["status", "=", filter.status]
        ],
        if (filter.query.containsValidValue) ...[
          ["name", "LIKE", '%${filter.query}%']
        ],
      ];
      
      final config = RequestConfig(
        url: Urls.gateExits,
        reqParams: {
          'fields': ["*"],
          'order_by': "creation DESC",
          'limit': 10,
          'limit_start': start,
          if (filters.isNotEmpty) ...{
            'filters': filters,
          }
        },
        parser: (p0) {
          final exits = p0['data'] as List<dynamic>;
          return exits.map((e) => GateExitForm.fromJson(e)).toList();
        },
      );
      $logger.devLog(config);
      final response = await get(config);
      return response.process((r) => right(r.data!));
    } on Exception catch (e, st) {
      $logger.error('[GateExit]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<Pair<String, String>> createGateExit(GateExitForm form) async {
    try {
      final formJson = GateExitForm.toEncodedFormJson(form);
      formJson.update('status', (value) => 'Draft');
      final cleanedMap = removeNullValues(formJson);
      $logger.devLog(formJson);
      final config = RequestConfig(
        url: Urls.createGateExit,
        reqParams:cleanedMap,
        parser: (p0) => p0['message']['gate_exit_no'] as String,
      );

      final response = await multiPart(config);
      return response.process((r) {
        final docNo = r.data!;
        const successMsg =
            'The Gate Exit Details have been saved successfully.';
        return right(Pair(docNo, successMsg));
        
      });
    
    } on Exception catch (e, st) {
      $logger.error('[Gate Exit Creation]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<String> submitGateExit(GateExitForm form) async {
    try {
      final formJson = GateExitForm.toEncodedFormJson(form);
      formJson.update('status', (value) => 'Submitted');
      final cleanedMap = removeNullValues(formJson);
      final config = RequestConfig(
        url: Urls.createGateExit,
        reqParams: cleanedMap,
        parser: (p0) => p0,
      );
      final response = await multiPart(config);
      return response.process((r) {
        const successMsg =
            'The Gate Exit Details have been submitted successfully.';
        return right(successMsg);
      });
    } on Exception catch (e, st) {
      $logger.error('[Gate Exit Submit]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<SalesInvoice> getSalesInvoice(String name) async {
    try {
      final config = RequestConfig(
        url: Urls.salesInvoice,
        body: jsonEncode({'sales_invoice': name.trim()}),
        parser: (p0) => p0,
      );
      final response = await post(config);
      return response.process((r) {
        final message = r.data!['message'] as Map<String, dynamic>;
        final status = message['status'] as String;
        if(status == 'success') {
          final data = message['data'];
          return right(SalesInvoice.fromJson(data).copyWith(name: name));
        }
        final errorMsg = message['message'];
        return left(Failure(error: errorMsg));
      });
    } on Exception catch (e, st) {
      $logger.error('[Gate Exit Submit]', e, st);
      return left(Failure(error: e.toString()));
    }
  }
}
