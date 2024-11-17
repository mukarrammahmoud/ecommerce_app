import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:first_app/presentation/ui/cart/widgets/sliver_list_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SliverListCart(),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: AppColor.splashColor,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            text: "SubTotal (3)",
                          ),
                          AppText(
                            text: "\$992.43",
                            isBold: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            text: "Shipping",
                          ),
                          AppText(
                            text: "\$992.43",
                            isBold: true,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 10,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            text: "Total (3 Item)",
                          ),
                          AppText(
                            text: "\$992.43",
                            textColor: AppColor.priomaryColorApp,
                            isBold: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColor.priomaryColorApp,
                  marginHorizntal: 0,
                  onPressed: () {
                    context.read<CartCubit>().navigateToChekoutPage(context);
                  },
                  title: const AppText(
                    text: "CheckOut",
                    textColor: AppColor.splashColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
