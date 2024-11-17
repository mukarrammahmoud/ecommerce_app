import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/notifications/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowFilterNotification extends StatelessWidget {
  const RowFilterNotification({super.key});

  @override
  Widget build(BuildContext context) {
    List filterItems = [
      "All",
      "Read",
      "UnRead",
    ];
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filterItems.length,
            itemBuilder: (context, index) => CustomButton(
              marginHorizntal: 0,
              widthContainer: MediaQuery.sizeOf(context).width / 3,
              radius: 0,
              color: state.selectedfilter == index
                  ? AppColor.priomaryColorApp
                  : Colors.grey.shade300,
              onPressed: () {
                context.read<NotificationCubit>().selcetItemToFilter(index);
              },
              title: AppText(
                isBold: true,
                text: filterItems[index],
                textColor: state.selectedfilter == index
                    ? AppColor.splashColor
                    : AppColor.neutralsColor.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}
