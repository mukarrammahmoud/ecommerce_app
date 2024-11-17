import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class LabelCategory extends StatelessWidget {
  const LabelCategory(
      {required this.title, this.titleTow = "See All", super.key, this.onTap});
  final String title;
  final String titleTow;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: title,
            isBold: true,
            fontSize: 25,
          ),
          InkWell(
            onTap: onTap,
            child: AppText(
              text: titleTow,
              textColor: AppColor.priomaryColorApp,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
