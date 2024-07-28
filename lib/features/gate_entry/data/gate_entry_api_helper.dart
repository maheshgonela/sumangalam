import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gate_entry/model/po_order.dart';
import 'package:sumangalam/features/gate_entry/model/supplier.dart';

@injectable
class PurchaseOrderHelper extends UseCase<List<POOrder>, String> {
  PurchaseOrderHelper({required this.repo});

  final GateEntryRepo repo;
  @override
  Future<List<POOrder>> call(params) async {
    final res = await repo.fetchPurchaseOrders(params);
    return res.fold((l) => <POOrder>[], (r) => r);
  }
}

@injectable
class SupplierListHelper extends UseCase<List<Supplier>, String> {
  SupplierListHelper({required this.repo});

  final GateEntryRepo repo;
  @override
  Future<List<Supplier>> call(params) async {
    final res = await repo.getSuppliers(params);
    return res.fold((l) => <Supplier>[], (r) => r);
  }
}

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}
