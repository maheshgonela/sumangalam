import 'package:flutter/material.dart';

import 'package:sumangalam/core/ext/context_ext.dart';
import 'package:sumangalam/core/model/id_name.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({Key? key, required this.record}) : super(key: key);

  final IdName record;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.background,
              blurRadius: 8,
              offset: const Offset(4, 16),
            ),
          ],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: ListTile(
          leading: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.grey),
          ),
          dense: true,
          visualDensity: const VisualDensity(vertical: -3),
          tileColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(
                color: AppColors.deepSapphire, width: 1, strokeAlign: 4),
          ),
          title: Text(
            record.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => context.exit(record),
        ),
      ),
    );
  }
}
