import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class BottomRowButtons extends StatelessWidget {
  const BottomRowButtons({
    required this.onPressedOne,
    required this.onPressedTow,
    required this.textOne,
    required this.textOTow,
    super.key,
  });
  final String textOne;
  final String textOTow;
  final void Function()? onPressedOne;
  final void Function()? onPressedTow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Expanded(
          child: CustomButton(
            colorBorder: AppColor.neutralsColor.withOpacity(0.8),
            color: AppColor.splashColor,
            onPressed: onPressedOne,
            title:  AppText(
              text: textOne,
              isBold: true,
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: onPressedTow,
            title:  AppText(
              text: textOTow,
              isBold: true,
              textColor: AppColor.splashColor,
            ),
          ),
        ),
      ],
    ));
  }
}
