import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class ItemChecOut extends StatelessWidget {
  const ItemChecOut({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "Mens Clothes",
                    isBold: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: AppColor.successColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 33,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const AppText(
                        text: "M",
                        isBold: true,
                        textColor: AppColor.splashColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AppText(
                      text: "92(2)",
                      textColor: AppColor.priomaryColorApp,
                      isBold: true,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
