
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class RowOfColor extends StatelessWidget {
  const RowOfColor({
    required this.onTapColor,
    required this.index,
    required this.indexColor,
    required this.containerColor,
    super.key,
  });
  final Function()? onTapColor;
  final Color containerColor;
  final int indexColor;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapColor,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor,
          border: Border.all(
            width: 2,
            color: AppColor.neutralsColor.withOpacity(.2),
          ),
        ),
        child: indexColor == index
            ? const Icon(
                Icons.done_outline_sharp,
                color: AppColor.splashColor,
              )
            : null,
      ),
    );
  }
}

class ListFiltringItem extends StatelessWidget {
  const ListFiltringItem({
    required this.index,
    required this.text,
    required this.selectedfilter,
    required this.onPressed,
    super.key,
  });
  final int selectedfilter;
  final int index;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      colorBorder: selectedfilter == index
          ? AppColor.neutralsColor
          : AppColor.neutralsColor.withOpacity(.5),
      color: selectedfilter == index ? Colors.black : AppColor.splashColor,
      onPressed: onPressed,
      title: AppText(
        textColor:
            selectedfilter == index ? AppColor.splashColor : Colors.black,
        text: text,
      ),
    );
  }
}
