import 'package:flutter/material.dart';
import 'history_app_bar.dart';
import 'history_tab_bar.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HistoryAppBar(),
        Expanded(child: HistoryTabBar()),
      ],
    );
  }
}
