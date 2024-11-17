import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class ContainerDetailsOrder extends StatelessWidget {
  const ContainerDetailsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 2, color: AppColor.neutralsColor.withOpacity(.3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppText(
                text: "Amount",
                textColor: AppColor.neutralsColor.withOpacity(.5),
              ),
              AppText(
                text: "Order Date ",
                textColor: AppColor.neutralsColor.withOpacity(.5),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppText(
                text: "\$ 993.3",
                isBold: true,
              ),
              AppText(
                text: "30-sep-2024",
                isBold: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
