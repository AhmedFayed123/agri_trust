import 'package:agri_trust/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../manger/advertisings_cubit/advertisings_cubit.dart';
import '../../manger/advertisings_cubit/advertisings_state.dart';
import 'advertisings_list_item.dart';

class AdvertisingsList extends StatelessWidget {
  const AdvertisingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdvertisingsCubit(HomeRepoImpl())..fetchAdvertisings(),
      child: BlocBuilder<AdvertisingsCubit, AdvertisingsState>(
        builder: (context, state) {
          if (state is AdvertisingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdvertisingsLoaded) {
            final adverts = state.adverts;

            return CarouselSlider.builder(
              itemCount: adverts.length,
              itemBuilder: (context, index, realIndex) {
                final advert = adverts[index];
                return AdvertisingsListItem(
                  imageUrl: advert.img,
                );
              },

              options: CarouselOptions(
                height: 195.h,
                viewportFraction: .9,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            );
          } else if (state is AdvertisingsError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
