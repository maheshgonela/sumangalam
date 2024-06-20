import 'package:flutter/material.dart';
import 'package:sumangalam/core/router/app_route.dart';

import '../../../../../app/widgets/app_page_view2.dart';


class GateEntryListScrn extends StatelessWidget {
  const GateEntryListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2(
      mode: PageMode2.gateentry,
      onNew: ()=> RoutePath.newGateEntry.push(context),
      child: Container()
    );
  }
}
