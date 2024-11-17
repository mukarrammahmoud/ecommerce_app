import 'package:first_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CardSetting extends StatelessWidget {
  const CardSetting(
      {super.key, required this.icon, required this.widgetInMiddle});
  final IconData icon;
  final Widget widgetInMiddle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: AppColor.neutralsColor.withOpacity(0.6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          widgetInMiddle,
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
    );
  }
}
