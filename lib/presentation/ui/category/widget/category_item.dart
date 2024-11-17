import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.index,
    required this.category,
    required this.onTap,
  });
  final String category;
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    List containerColors = [
      AppColor.successColor.withOpacity(0.6),
      Colors.grey.withOpacity(0.6),
      AppColor.warrningColor.withOpacity(0.6),
      AppColor.neutralsColor.withOpacity(0.6),
    ];
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: containerColors[index % containerColors.length],
              borderRadius: BorderRadius.circular(500),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                height: 120,
                width: 120,
                category == 'jewelery'
                    ? AppImages.rang
                    : (category == "men's clothing"
                        ? AppImages.ja
                        : (category == "women's clothing")
                            ? AppImages.women
                            : AppImages.lap),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: MediaQuery.sizeOf(context).width * .1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppText(
                text: category,
                isBold: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
