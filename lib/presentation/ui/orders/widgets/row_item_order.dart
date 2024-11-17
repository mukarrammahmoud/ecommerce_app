import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';


class RowItemInOrder extends StatelessWidget {
  const RowItemInOrder({
    super.key,
    required this.title,
    required this.subTile,
    required this.leading,
    required this.trailing,
  });

  final String title;
  final String subTile;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title:  AppText(
              text: title,
            ),
            subtitle: AppText(
              text: subTile,
              textColor: AppColor.neutralsColor.withOpacity(0.5),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:leading,
            ),
            trailing:   trailing,
            ),
          
        ),
      ],
    );
  }
}
