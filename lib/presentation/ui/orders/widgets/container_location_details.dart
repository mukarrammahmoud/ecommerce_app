import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:first_app/presentation/ui/orders/widgets/row_item_order.dart';
class ContainerLocationDetails extends StatelessWidget {
  const ContainerLocationDetails({
    required this.leading,
    required this.title,
    required this.subTile,
    required this.trailing,
    super.key,
  });
  final String title;
  final String subTile;
  final Widget leading;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 2, color: AppColor.neutralsColor.withOpacity(.5))),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppText(
                    text: 'Delivery Address',
                    isBold: true,
                  ),
                  AppText(
                    text: 'Sanaa hail st',
                  ),
                  AppText(
                    text: 'Delware 33',
                  ),
                ],
              ),
              Column(
                children: [
                  AppText(
                    text: 'Estimated Time',
                    isBold: true,
                  ),
                  AppText(
                    text: 'Today',
                  ),
                  AppText(
                    text: '9AM TO 10  PM',
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: AppColor.neutralsColor.withOpacity(.5),
          ),
          RowItemInOrder(title: title, subTile: subTile, leading: leading, trailing: trailing),
        ],
      ),
    );
  }
}
