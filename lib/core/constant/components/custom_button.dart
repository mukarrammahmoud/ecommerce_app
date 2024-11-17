import 'package:first_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = AppColor.priomaryColorApp,
    this.colorBorder = AppColor.neutralsColor,
    required this.onPressed,
    required this.title,
    this.width = 0,
    this.widthContainer,
    this.radius = 8,
    this.marginHorizntal = 18,
  });
  final void Function()? onPressed;
  final Widget title;

  final Color color;
  final Color colorBorder;
  final double width;
  final double? widthContainer;
  final double radius;
  final double marginHorizntal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthContainer,
      margin: EdgeInsets.symmetric(horizontal: marginHorizntal),
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder, width: 2),
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: MaterialButton(
        shape: const BeveledRectangleBorder(),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
            ),
            title,
          ],
        ),
      ),
    );
  }
}
