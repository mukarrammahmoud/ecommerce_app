import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/notifications/cubit/notification_cubit.dart';
import 'package:first_app/presentation/ui/notifications/widgets/notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowNotifications extends StatelessWidget {
  const ShowNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationCubit>(
      create: (context) => NotificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<NotificationCubit, NotificationState>(
              builder: (contextA, state) {
                return IconButton(
                  onPressed: () {
                    contextA.read<NotificationCubit>().onTapSetting(contextA);
                  },
                  icon: const Icon(Icons.settings_outlined),
                );
              },
            ),
          ],
          title: const AppText(
            text: "Notification",
            fontSize: 25,
            isBold: true,
          ),
          scrolledUnderElevation: 0,
        ),
        body: const NotificationBody(),
      ),
    );
  }
}
