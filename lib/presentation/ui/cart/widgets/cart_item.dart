import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/constant/functions/buton.dart';
import 'package:first_app/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.prodectFromCart,
    required this.quantity,
    required this.color,
    required this.price,
    required this.stateIndex,
    required this.onPressed,
    required this.onDecreaseCounter,
    required this.removeItem,
  });
  final Color color;
  final Product prodectFromCart;
  final int stateIndex;
  final int quantity;
  final int price;
  final void Function()? onPressed;
  final void Function()? removeItem;
  final void Function()? onDecreaseCounter;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.splashColor.withOpacity(.8),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              prodectFromCart.thumbnail,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: prodectFromCart.title,
                    isBold: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: (quantity * prodectFromCart.price).toStringAsFixed(2),
                    isBold: true,
                    textColor: AppColor.neutralsColor.withOpacity(.3),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "\$${prodectFromCart.price}",
                    isBold: true,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: removeItem,
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: CustomButton(
                  marginHorizntal: 0,
                  color: const Color.fromARGB(255, 239, 237, 237),
                  onPressed: () {},
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonCart(
                        icon: Icons.remove,
                        onPressed: onDecreaseCounter,
                      ),
                      AppText(
                        text: "$quantity",
                        fontSize: 18.sp,
                      ),
                      buttonCart(
                        icon: Icons.add,
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
