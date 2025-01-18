import 'package:agri_trust/features/wallet/presentation/views/widgets/wallet_view_body.dart';
import 'package:flutter/material.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WalletViewBody(),
      ),
    );
  }
}
