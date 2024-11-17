import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class Notificatioin extends StatelessWidget {
  const Notificatioin({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.notifications_outlined,
            size: 25,
          ),
        ),
        Positioned(
          right: 6,
          child: Container(
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            child: const AppText(
              text: "3",
              fontSize: 14,
              textColor: AppColor.splashColor,
            ),
          ),
        )
      ],
    );
  }
}
