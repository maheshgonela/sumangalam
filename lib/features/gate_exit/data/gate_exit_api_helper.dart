import 'package:injectable/injectable.dart';
import 'package:sumangalam/features/gate_exit/model/shipment.dart';
import 'package:sumangalam/features/gate_exit/data/gate_exit_repo.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_api_helper.dart';

@injectable
class ShipmentListHelper extends UseCase<List<Shipment>, String> {
  ShipmentListHelper({required this.repo});

  final GateExitRepo repo;

  @override
  Future<List<Shipment>> call([String? params]) async {
    final res = await repo.fetchPonumberlist();
    return res.fold((l) => <Shipment>[], (r) => r);
  }
}
