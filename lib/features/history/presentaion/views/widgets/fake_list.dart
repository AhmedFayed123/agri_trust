import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_product_item.dart';

class FakeList extends StatelessWidget {
  const FakeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return const CustomProductItem();
      },
    );
  }
}
