import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/app/widgets/app_page_view2.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/widgets/infinite_list_widget.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry_filter/gate_entry_filters.dart';
import 'package:sumangalam/features/gate_entry/presentation/widgets/gate_entry_widget.dart';

class GateEntryListScrn extends StatelessWidget {
  const GateEntryListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2(
      mode: PageMode2.gateentry,
      onNew: ()=> RoutePath.newGateEntry.push(context),
      child: InfiniteListViewWidget<GateEntriesCubit, GateEntryForm>(
        childBuilder: (context, entry) => GateEntryWidget(
          gateEntry: entry,
          onTap: () => RoutePath.newGateEntry.push<bool?>(context, extra: entry),
        ), 
        fetchInitial: () => fetchInital(context), 
        fetchMore: () => fetchMore(context), 
        emptyListText: 'No GateEntries Found',
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<GateEntryFilterCubit>().state;
    context.cubit<GateEntriesCubit>().fetchInitial(filter);
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<GateEntryFilterCubit>().state;
    context.cubit<GateEntriesCubit>().fetchMore(filter);
  }
}
