import 'package:agri_trust/features/wallet/presentation/views/widgets/replacing_list_item.dart';
import 'package:flutter/material.dart';

class ReplacingList extends StatelessWidget {
  const ReplacingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        return const ReplacingListItem();
      },
    );
  }
}
