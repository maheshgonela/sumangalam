import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit/new_gate_exit_cubit.dart';

class GateExitBuilder extends StatelessWidget {
  const GateExitBuilder({super.key, required this.builder, this.buildWhen});

  final BlocWidgetBuilder<NewGateExitState> builder;
  final BlocBuilderCondition<NewGateExitState>? buildWhen;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewGateExitCubit, NewGateExitState>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}