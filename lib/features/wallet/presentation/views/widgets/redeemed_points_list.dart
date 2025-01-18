import 'package:agri_trust/features/wallet/presentation/views/widgets/wallet_list_item.dart';
import 'package:flutter/material.dart';

class RedeemedPointsList extends StatelessWidget {
  const RedeemedPointsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return const WalletListItem();
      },
    );
  }
}
