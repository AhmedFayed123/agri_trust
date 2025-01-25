import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../../manger/home_product_cubit/home_product_cubit.dart';
import '../../manger/home_product_cubit/home_product_state.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeProductCubit(HomeRepoImpl())..fetchProducts(),
      child:  BlocBuilder<HomeProductCubit, HomeProductState>(
          builder: (context, state) {
            if (state is HomeProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeProductLoaded) {
              final products = state.products;
              return SizedBox(
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.h),
                      child: Center(
                        child: Container(
                          width: 375.w,
                          height: 59.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.4.w,
                                style: BorderStyle.solid,
                                color: AppColors.listItemBorder,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name,
                                        style: AppStyles.tajawal14.copyWith(color: AppColors.oxfordBlue,),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            product.productionDate,
                                            style: AppStyles.tajawal14.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.gray2,
                                            ),
                                          ),
                                          Text(
                                            AppStrings.dash,
                                            style: AppStyles.tajawal14.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.gray2,
                                            ),
                                          ),
                                          Text(
                                            product.details,
                                            style: AppStyles.tajawal14.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.gray2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Image.asset(
                                    height: 51.h,
                                    width: 51.w,
                                    AssetsPath.bag,
                                    fit: BoxFit.fitHeight,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is HomeProductError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No Data'));
          },
        ),
    );
  }
}
