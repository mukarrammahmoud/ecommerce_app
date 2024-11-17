import 'package:first_app/presentation/controller/home/cubit/home_cubit.dart';
import 'package:first_app/presentation/ui/home/widgets/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionAppBarHome extends StatelessWidget {
  const ActionAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Notificatioin(
          onPressed: () {
            context.read<HomeCubit>().navigateToNotificationPage(context);
          },
        );
      },
    );
  }
}