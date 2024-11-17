
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class NotificationToday extends StatelessWidget {
  const NotificationToday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.priomaryColorApp.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  height: 50,
                  width: 50,
                  child: const Icon(
                    Icons.done_outline_rounded,
                    color: AppColor.priomaryColorApp,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.priomaryColorApp,
                      borderRadius: BorderRadius.circular(50)),
                  height: 10,
                  width: 10,
                )
              ],
            ),
            title: const AppText(
              text: "Summer Sale: Get up To 50 % off on selecte Item",
            ),
            subtitle: AppText(
              text: "227 Hours",
              textColor: AppColor.neutralsColor.withOpacity(0.5),
            ),
          ),
        );
      },
    );
  }
}
