import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart';

class GateEntryBuilder extends StatelessWidget {
  const GateEntryBuilder({super.key, required this.builder, this.buildWhen});

  final BlocWidgetBuilder<NewGateEntryState> builder;
  final BlocBuilderCondition<NewGateEntryState>? buildWhen;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}