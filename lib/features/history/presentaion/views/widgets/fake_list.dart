import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/history_repo_impl.dart';
import '../../manger/history_cubit/history_cubit.dart';
import '../../manger/history_cubit/history_state.dart';
import 'custom_product_item.dart';

class FakeList extends StatelessWidget {
  const FakeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit(HistoryRepoImpl())..fetchUserFailedScan(),
      child:  BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HistorySuccess) {
            return ListView.builder(
              itemCount: state.scanResponse.data.length,
              itemBuilder: (context, index) {
                final item = state.scanResponse.data[index];

                return CustomProductItem(
                  itemTitle: item.product.name,
                  details: item.product.details,
                  scanStatus: item.scanStatus,
                );
              },
            );
          } else if (state is HistoryFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return const Center(child: Text('Please load data'));
        },
      ),
    );
  }
}
