
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:first_app/presentation/ui/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          return CartItem(
                            index: index,
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

