import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/payment/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 80,
                color: AppColor.successColor.withOpacity(0.7),
              ),
              AppText(
                text: "Congratulations",
                isBold: true,
                fontSize: 25,
                textColor: AppColor.successColor.withOpacity(
                  0.7,
                ),
              ),
              AppText(
                text: "Your Payment Is Successful",
                isBold: true,
                fontSize: 20,
                textColor: AppColor.neutralsColor.withOpacity(
                  0.7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: AppText(
                  text:
                      "Thank You for Your purchase! Your Order is Now Being proccesed",
                  textColor: AppColor.neutralsColor.withOpacity(
                    0.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      context
                          .read<PaymentCubit>()
                          .navigateToOrderTracingPage(context);
                    },
                    title: const AppText(
                      text: 'Track Order Status',
                      isBold: true,
                      textColor: AppColor.splashColor,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  return CustomButton(
                    colorBorder: AppColor.priomaryColorApp,
                    color: AppColor.splashColor,
                    onPressed: () {
                      context.read<PaymentCubit>().navigateToHomePage(context);
                    },
                    title: const AppText(
                      text: 'Back To Home',
                      isBold: true,
                      textColor: AppColor.priomaryColorApp,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
