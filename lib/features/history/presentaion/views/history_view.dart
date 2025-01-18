import 'package:agri_trust/features/history/presentaion/views/widgets/history_view_body.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HistoryViewBody(),
      ),
    );
  }
}
