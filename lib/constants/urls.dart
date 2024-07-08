

import 'package:sumangalam/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  factory Urls.test() => const Urls('https://testsumangalam.easycloud.co.in/api');

  const Urls(this.url);

  final String url;

  static const isTest = true;

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';

  static final login = '$cusWs/login';
  static final gateEntries = '$cusWs/sumangalam.api.get_gate_entry_records';
  static final createGateEntry = '$cusWs/sumangalam.api.create_gate_entry_record';
  static final gateEntryAttachments = '$cusWs/sumangalam.api.get_gate_entry_attachments';
  static final purchaseOrders = '$cusWs/sumangalam.api.get_purchase_order_no';
  static final supplierList = '$cusWs/sumangalam.api.get_supplier_list';

  static filepath(String path) => '${baseUrl.replaceAll('api', '')}/$path';
}