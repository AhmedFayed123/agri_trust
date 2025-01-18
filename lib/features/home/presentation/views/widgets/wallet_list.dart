import 'package:flutter/material.dart';
import '../../../../wallet/presentation/views/widgets/wallet_list_item.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const WalletListItem();
        },
      ),
    );
  }
}
