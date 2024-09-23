import 'package:injectable/injectable.dart';
import 'package:sumangalam/features/gate_exit/model/delivery_note.dart';
import 'package:sumangalam/features/gate_exit/data/gate_exit_repo.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_api_helper.dart';

@injectable
class ShipmentListHelper extends UseCase<List<DeliveryNote>, String> {
  ShipmentListHelper({required this.repo});

  final GateExitRepo repo;

  @override
  Future<List<DeliveryNote>> call([String? params]) async {
    final res = await repo.fetchPonumberlist();
    return res.fold((l) => <DeliveryNote>[], (r) => r);
  }
}
