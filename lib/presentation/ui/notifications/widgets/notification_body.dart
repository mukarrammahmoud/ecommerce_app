
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/ui/notifications/widgets/notification_today.dart';
import 'package:first_app/presentation/ui/notifications/widgets/row_filter_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50.h,
            child: const RowFilterNotification(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 30.h,
                child: const AppText(
                  text: "Today",
                  fontSize: 20,
                  isBold: true,
                ),
              ),
            ),
          ),
        ),
        const NotificationToday(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 25.h,
            child: const AppText(
              text: "View All",
              fontSize: 18,
              isBold: true,
              textColor: AppColor.priomaryColorApp,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 30.h,
                child: const AppText(
                  text: "1 Week Ago",
                  fontSize: 20,
                  isBold: true,
                ),
              ),
            ),
          ),
        ),
        const NotificationToday(),
      ],
    );
  }
}
