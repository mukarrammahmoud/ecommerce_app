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
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            const SliverListCart(),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: AppColor.splashColor,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.only(bottom: 40, top: 40),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(250, 255, 255, 255)
                            .withOpacity(.5),
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppText(
                                  text: "SubTotal ( ${state.prodects.length})",
                                ),
                                const AppText(
                                  text: "\$992.43",
                                  isBold: true,
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            ),
                            const Divider(
                              color: Colors.black12,
                              thickness: 2,
                              height: 10,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    text:
                                        "Total ( ${state.prodects.length} Item) ",
                                  ),
                                  AppText(
                                    text:
                                        "\$ ${state.total.toStringAsFixed(2)}",
                                    textColor: AppColor.priomaryColorApp,
                                    isBold: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      color: AppColor.priomaryColorApp,
                      marginHorizntal: 0,
                      onPressed: () {
                        context
                            .read<CartCubit>()
                            .navigateToChekoutPage(context);
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
      },
    );
  }
}
