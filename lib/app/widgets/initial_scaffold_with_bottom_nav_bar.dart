import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class InitialScaffoldWithBottomNavBar extends StatelessWidget {
  const InitialScaffoldWithBottomNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomAppBar(
          height: 60,
          padding: const EdgeInsets.all(0),
          surfaceTintColor: AppColors.white,
          child: DefaultTabController(
            length: 2,
            initialIndex: navigationShell.currentIndex,
            child: TabBar(
              dividerColor: AppColors.white,
              labelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.black54,
              
              tabs: const [
                Tab(icon: Icon(Icons.home_outlined),),
             
                Tab(icon: Icon(Icons.person_2_outlined), ),
              ],
              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
