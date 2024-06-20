import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/base_api_repo.dart';
import 'package:sumangalam/core/network/request_config.dart';
import 'package:sumangalam/features/gateEntry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gateEntry/model/new_gate_entry_form.dart';

import '../../../constants/urls.dart';

@LazySingleton(as: GateEntryRepo)
class GateEntryRepoImpl extends BaseApiRepository implements GateEntryRepo {
  const GateEntryRepoImpl(super.client);

 

  @override
  AsyncValueOf<String> createGateEntry(GateEntryForm form) async {
    // final config = RequestConfig(
    //   url: Urls.login,
    //   parser: (json) {
    //     final data = json['message']['data'] as Map<String,dynamic>;
    //     return data['name'] as String;
    //   }, 
    //   body: jsonEncode(form.toJson()),
    // );
    // final response = await post(config);
    // return response.process((docNo) {
    //   final msgWithDocNo = """A New Gate Entry "${docNo.data}" is created successfully.""";
    //   return right(msgWithDocNo);
    // });

    final formDataJson = jsonEncode(form.toJson());
    print(formDataJson);
        await Future.delayed(const Duration(seconds: 1));
    return right('Gate Entry Created Successfully');
  }

  @override
  AsyncValueOf<String> submitGateEntry(GateEntryForm form) async {
    final config = RequestConfig(
      url: Urls.login,
      parser: (json) {
        final data = json['message']['data'] as Map<String,dynamic>;
        return data['name'] as String;
      }, 
      body: jsonEncode(form.toJson()),
    );
    final response = await post(config);
    return response.process((docNo) {
      final msgWithDocNo = """Gate Entry ${docNo.data} is submitted successfully.""";
      return right(msgWithDocNo);
    });
  }
  
}