import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/network_request/network_request_cubit.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry_filter/gate_entry_filters.dart';

typedef GateEntriesCubit = InfiniteListCubit<GateEntryForm, GateEntryFilter, GateEntryFilter>;
typedef GateEntriesState = InfiniteListState<GateEntryForm>;

typedef AttachmentsCubit = NetworkRequestCubit<GateEntryAttachments, String>;
typedef AttachmentsState = NetworkRequestState<GateEntryAttachments>;

@injectable
class GateEntryBlocProvider {
  const GateEntryBlocProvider({required this.repo});

  final GateEntryRepo repo;

  static GateEntryBlocProvider instance() => $sl.get<GateEntryBlocProvider>();

  GateEntriesCubit gateEntries() => GateEntriesCubit(
    requestInitial: (params, state) => repo.fetchGateEntries(params!, 0, 20),
    requestMore: (params, state) => repo.fetchGateEntries(params!, state.curLength + 1, state.curLength + 20),
  );

  AttachmentsCubit fetchAttachments() => AttachmentsCubit(
    onRequest: (params, state) => repo.fetchAttachments(params!),
  );
}