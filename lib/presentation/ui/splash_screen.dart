import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(context: context),
      child: Scaffold(
        backgroundColor: AppColor.splashColor,
        body: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_task,
                    color: AppColor.priomaryColorApp,
                    size: 45,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AppText(
                    text: "STYLISTA",
                    isBold: true,
                    fontSize: 25,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
