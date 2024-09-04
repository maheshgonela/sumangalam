
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/app/widgets/app_page_view2.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/bloc_providers.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit_filter/gate_exit_filters.dart';
import 'package:sumangalam/features/gate_exit/presentation/ui/exits/widgets/gate_exit_widget.dart';

class GateExitListScrn extends StatelessWidget {
  const GateExitListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2(
      mode: PageMode2.gateexit,
      onNew: () => RoutePath.newGateExit.push(context),
      child: InfiniteListViewWidget<GateExitsCubit, GateExitForm>(
        childBuilder: (context, exit) => GateExitWidget(
          gateExit: exit,
          onTap: () => RoutePath.newGateExit.push<bool?>(context, extra: exit),
        ),
        fetchInitial: () => fetchInital(context),
        fetchMore: () => fetchMore(context),
        emptyListText: 'No Gate Exit found with matching filters.',
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitsCubit>().fetchInitial(filter);
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitsCubit>().fetchMore(filter);
  }
}
