import 'package:agri_trust/features/history/presentaion/views/history_view.dart';
import 'package:agri_trust/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:agri_trust/features/home/presentation/views/widgets/drawer_body.dart';
import 'package:agri_trust/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/bottom_nav_bar_cubit/navigation_cubit.dart';
import '../manger/bottom_nav_bar_cubit/navigation_state.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeViewBody(scaffoldKey: scaffoldKey,),
      const HistoryView(),
    ];

    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              int selectedIndex = 0;
              if (state is NavigationSelected) {
                selectedIndex = state.selectedIndex;
              }

              if (selectedIndex < 0 || selectedIndex >= pages.length) {
                selectedIndex = 0;
              }

              return pages[selectedIndex];
            },
          ),
          key: scaffoldKey,
          endDrawer: const DrawerBody(),
          bottomNavigationBar: const CustomBottomNavBar(),
        ),
      ),
    );
  }
}
