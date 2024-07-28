import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/app/widgets/status_menu_widget.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';
import 'package:sumangalam/core/widgets/simple_search_bar.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry_filter/gate_entry_filters.dart';

enum PageMode2 {
  gateentry('Gate Entry'),
  gateexit('Gate Exit');

  final String name;
  const PageMode2(this.name);
}

class AppPageView2 extends StatelessWidget {
  const AppPageView2({
    super.key,
    required this.child,
    required this.mode,
    required this.onNew,
  });

  final Widget child;
  final PageMode2 mode;
  final VoidCallback onNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mode == PageMode2.gateentry
          ? AppColors.powderBlue
          : AppColors.powderBlue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 52,
            top: -24,
            child: mode == PageMode2.gateentry
                ? Image.asset(
                    AppIcons.grateEntryBG.path,
                    alignment: Alignment.topRight,
                    fit: BoxFit.cover,
                    height: 210,
                    width: context.sizeOfWidth,
                  )
                : Image.asset(AppIcons.grateEntryBG.path,
                    alignment: Alignment.topRight,
                    fit: BoxFit.cover,
                    height: 210),
          ),
          Positioned(
              left: 18,
              top: kToolbarHeight,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _GoBackWidget(),
                    AppSpacer.p8(),
                    Text(mode.name,
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                  ],
                ),
              )),
          Positioned(
            top: kToolbarHeight + 32,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SimpleSearchBar(
                      hintText: mode == PageMode2.gateentry
                          ? 'Search Gate Entry - ID'
                          : 'Search Gate Exit - ID',
                      onCancel: () {
                        if (mode == PageMode2.gateentry) {
                          final filterState = context.read<GateEntryFilterCubit>().state;
                          context
                            ..cubit<GateEntryFilterCubit>().onSearch(null)
                            ..cubit<GateEntriesCubit>().fetchInitial(GateEntryFilter(status: filterState.status));
                        } else {}
                      },
                      onSearch: (query) {
                        if (mode == PageMode2.gateentry) {
                          final filterState = context.read<GateEntryFilterCubit>().state;
                          final filters = filterState.copyWith(query: query);
                          context
                            ..cubit<GateEntryFilterCubit>().onSearch(query)
                            ..cubit<GateEntriesCubit>().fetchInitial(filters);
                        } else {}
                      },
                    ),
                  ),
                  AppSpacer.p8(),
                  Expanded(
                    flex: 1,
                    child: StatusMenuWidget(
                      onChange: (status) {
                        final filterState = context.read<GateEntryFilterCubit>().state;
                        final filters = filterState.copyWith(status: status);
                        context
                          ..cubit<GateEntryFilterCubit>().onChangeStatus(status)
                          ..cubit<GateEntriesCubit>().fetchInitial(filters);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: kToolbarHeight + 100,
            child: Container(
              width: context.sizeOfWidth,
              height: context.sizeOfHeight,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                border: Border.all(color: AppColors.white),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  )
                ],
              ),
              child: child,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        onPressed: onNew,
        backgroundColor: AppColors.cobaltBlue,
        icon: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        label: Text(
          "New",
          style: AppTextStyles.titleLarge(context)
              .copyWith(color: AppColors.white, fontSize: 22),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _GoBackWidget extends StatelessWidget {
  const _GoBackWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.pop,
      child: const CircleAvatar(
        radius: 12,
        backgroundColor: AppColors.black,
        child: Icon(Icons.arrow_back, color: AppColors.white, size: 16),
      ),
    );
  }
}
