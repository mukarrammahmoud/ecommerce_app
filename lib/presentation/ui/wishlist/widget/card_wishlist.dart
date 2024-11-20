import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class CardWishList extends StatelessWidget {
  const CardWishList({super.key});

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
              color: AppColor.warrningColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AppImages.ja,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "Mens Clothes",
                    isBold: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "Blue M",
                    isBold: true,
                    textColor: AppColor.neutralsColor.withOpacity(.3),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "\$99",
                    isBold: true,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.priomaryColorApp,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                color: Colors.black,
                onPressed: () {},
                marginHorizntal: 0,
                title: const AppText(
                  text: "Add to Cart",
                  textColor: AppColor.splashColor,
                  isBold: true,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
