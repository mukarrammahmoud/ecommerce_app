import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class CardWishList extends StatelessWidget {
  const CardWishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.asset(
              AppImages.shirt,
            ),
          ),
          const Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  text: "Mens Clothes",
                ),
                AppText(
                  text: "Blue M",
                ),
                AppText(
                  text: "\$99",
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              const Icon(
                Icons.favorite_border_outlined,
              ),
              CustomButton(
                color: Colors.black,
                onPressed: () {},
                title: const AppText(
                  text: "Add to Cart",
                  textColor: AppColor.splashColor,
                  fontSize: 10,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
