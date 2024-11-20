import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:first_app/presentation/ui/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverListCart extends StatelessWidget {
  const SliverListCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: CustomScrollView(
        slivers: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              bool isLoading = state.requestStatus == RequestStatus.loading &&
                  state.prodects.isEmpty;
              if (isLoading == true) {
                return SliverToBoxAdapter(
                  child: Lottie.asset(AppImages.loadingAnimation,
                      height: 100, width: 200),
                );
              }
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: ListView.builder(
                      itemCount: isLoading ? 5 : state.prodects.length,
                      itemBuilder: (context, index) {
                        if (isLoading) {
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              height: 80,
                              color: Colors.grey.shade200,
                            ),
                          );
                        } else {
                          List containerColors = [
                            AppColor.successColor.withOpacity(0.6),
                            Colors.grey.withOpacity(0.6),
                            AppColor.warrningColor.withOpacity(0.6),
                            AppColor.neutralsColor.withOpacity(0.6),
                          ];
                          return CartItem(
                            color:
                                containerColors[index % containerColors.length],
                            removeItem: () {
                              context.read<CartCubit>().removeItem(index);
                            },
                            onDecreaseCounter: () {
                              context.read<CartCubit>().decreaseCounter(index);
                            },
                            onPressed: () {
                              context.read<CartCubit>().increaseCounter(index);
                            },
                            price: 9,
                            quantity: state.count[index],
                            stateIndex: state.index,
                            prodectFromCart: state.prodects.elementAt(index),
                          );
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
